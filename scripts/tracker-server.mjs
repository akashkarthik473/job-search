/*
 * Local tracker server. Zero dependencies, Node 18+.
 *
 *   node scripts/tracker-server.mjs
 *
 * Serves tracker/tracker.html and exposes the CSV at /api/csv (GET + PUT).
 * Binds to 127.0.0.1 only -- nothing on your network can reach it.
 *
 * This exists because the browser File System Access API is blocked inside
 * VS Code's Simple Browser and is unreliable from file:// URLs. Going through
 * a real http:// origin makes saving work everywhere.
 */
import { createServer } from "http";
import { readFile, writeFile, copyFile } from "fs/promises";
import { fileURLToPath } from "url";
import { dirname, join } from "path";
import { exec } from "child_process";

const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = join(HERE, "..");
const HTML = join(ROOT, "tracker", "tracker.html");
const CSV = join(ROOT, "tracker", "applications.csv");
const BAK = join(ROOT, "tracker", ".applications.csv.bak");

const PORT = Number(process.env.PORT) || 4173;

const send = (res, code, type, body) => {
  res.writeHead(code, { "content-type": type, "cache-control": "no-store" });
  res.end(body);
};

const server = createServer(async (req, res) => {
  try {
    const path = new URL(req.url, "http://127.0.0.1").pathname;

    if (path === "/api/csv") {
      if (req.method === "GET") {
        return send(res, 200, "text/plain; charset=utf-8", await readFile(CSV, "utf8"));
      }
      if (req.method === "PUT") {
        let body = "";
        for await (const chunk of req) body += chunk;

        // Guardrails: never let a bug blank out the tracker.
        if (!body.trim()) return send(res, 400, "text/plain", "refusing to write an empty file");
        if (!body.split("\n")[0].includes("company")) {
          return send(res, 400, "text/plain", "refusing to write: header row missing");
        }

        await copyFile(CSV, BAK).catch(() => {});   // one-deep undo
        await writeFile(CSV, body, "utf8");
        const rows = body.trim().split("\n").length - 1;
        console.log(`  saved ${rows} row${rows === 1 ? "" : "s"}  ${new Date().toLocaleTimeString()}`);
        return send(res, 200, "text/plain", "ok");
      }
      return send(res, 405, "text/plain", "method not allowed");
    }

    if (path === "/" || path === "/index.html" || path === "/tracker.html") {
      return send(res, 200, "text/html; charset=utf-8", await readFile(HTML, "utf8"));
    }

    send(res, 404, "text/plain", "not found");
  } catch (e) {
    console.error(e);
    send(res, 500, "text/plain", "error: " + e.message);
  }
});

server.on("error", (e) => {
  if (e.code === "EADDRINUSE") {
    console.error(`Port ${PORT} is already in use — the tracker may already be running.`);
    console.error(`Open http://127.0.0.1:${PORT}/ , or set PORT to something else.`);
    process.exit(1);
  }
  throw e;
});

server.listen(PORT, "127.0.0.1", () => {
  const url = `http://127.0.0.1:${PORT}/`;
  console.log("");
  console.log("  Application Tracker  ->  " + url);
  console.log("  Editing: " + CSV);
  console.log("  Ctrl+C to stop.");
  console.log("");
  if (process.env.NO_OPEN) return;                       // set by the test run
  if (process.platform === "win32") exec(`start "" "${url}"`);
  else if (process.platform === "darwin") exec(`open "${url}"`);
});
