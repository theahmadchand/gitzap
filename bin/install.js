#!/usr/bin/env node

const fs = require("fs");
const os = require("os");
const path = require("path");
const { execSync } = require("child_process");

const homedir = os.homedir();
const profile = fs.existsSync(path.join(homedir, ".zshrc"))
  ? path.join(homedir, ".zshrc")
  : path.join(homedir, ".bashrc");

const installDir = path.join(homedir, ".gitzap");

if (!fs.existsSync(installDir)) {
  fs.mkdirSync(installDir);
}

fs.copyFileSync(path.join(__dirname, "../scripts/create-branch.sh"), path.join(installDir, "create-branch.sh"));
fs.copyFileSync(path.join(__dirname, "../scripts/prune-branches.sh"), path.join(installDir, "prune-branches.sh"));
fs.copyFileSync(path.join(__dirname, "../scripts/gitzap.js"), path.join(installDir, "gitzap.js"));

const profileContent = fs.readFileSync(profile, "utf8");
const pathExport = `\nexport PATH=\"$PATH:${installDir}\"\n`;
if (!profileContent.includes(installDir)) {
  fs.appendFileSync(profile, `\n# GitZap Path\n${pathExport}`);
  console.log(`✅ Updated PATH in ${profile}`);

  try {
    execSync(`source ${profile}`, { stdio: "inherit", shell: "/bin/bash" });
    console.log(`✅ Sourced profile automatically`);
  } catch (err) {
    console.log(`⚠️  Could not automatically source ${profile}. Please run: source ${profile}`);
  }
} else {
  console.log(`✅ GitZap PATH already exists in ${profile}`);
}

console.log(`✨ Done! You can now run: gitzap create-branch or gitzap prune-branches`);