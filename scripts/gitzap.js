#!/usr/bin/env node

const { execSync } = require("child_process");
const path = require("path");
const os = require("os");

const command = process.argv[2];
const scriptPath = path.join(os.homedir(), ".gitzap", "create-branch.sh");
const pruneScriptPath = path.join(os.homedir(), ".gitzap", "prune-branches.sh");

let version = "unknown";
if (fs.existsSync(packageJsonPath)) {
  const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, "utf8"));
  version = packageJson.version;
}


switch (command) {
  case "create-branch":
    execSync(`bash ${scriptPath}`, { stdio: "inherit", shell: "/bin/bash" });
    break;
  case "prune-branches":
    execSync(`bash ${pruneScriptPath}`, { stdio: "inherit", shell: "/bin/bash" });
    break;
  case "--version":
  case "-v":
    console.log(`Gitzap version: ${version}`);
    break;
  default:
    console.log("Usage:");
    console.log("  gitzap create-branch       Create a new Git branch");
    console.log("  gitzap prune-branches      Prune merged Git branches");
    console.log("  gitzap --version, -v       Show Gitzap version");
    process.exit(1);
}
