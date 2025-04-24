#!/usr/bin/env node

const { execSync } = require("child_process");
const path = require("path");
const os = require("os");

const command = process.argv[2];
const scriptPath = path.join(os.homedir(), ".gitzap", "create-branch.sh");
const pruneScriptPath = path.join(os.homedir(), ".gitzap", "prune-branches.sh");

switch (command) {
  case "create-branch":
    execSync(`bash ${scriptPath}`, { stdio: "inherit", shell: "/bin/bash" });
    break;
  case "prune-branches":
    execSync(`bash ${pruneScriptPath}`, { stdio: "inherit", shell: "/bin/bash" });
    break;
  default:
    console.log("Usage: gitzap create-branch | gitzap prune-branches");
    process.exit(1);
}
