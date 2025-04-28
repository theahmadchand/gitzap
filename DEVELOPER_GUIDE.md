# Gitzap Developer Guide

Welcome to the Gitzap developer documentation!

This guide helps contributors and maintainers set up their local environment, run scripts, and publish updates to npm.

---

## Table of Contents

- [Local Setup](#local-setup)
- [Available Scripts](#available-scripts)
- [Testing](#testing)
- [Publishing to npm](#publishing-to-npm)
- [Notes](#notes)

---

## Local Setup

First, clone the repository and install the required dependencies:

```bash
git clone https://github.com/theahmadchand/gitzap.git
cd gitzap
npm install
```

This will install all Node.js dependencies required for development.

## Available Scripts

### Install Gitzap Locally
Installs the Gitzap scripts into your home directory (~/.gitzap/) and updates your PATH.

```bash
npm run install
```
This script does the following:
- Copies shell and Node.js scripts into ~/.gitzap/
- Adds the Gitzap path to .zshrc or .bashrc
- Makes the gitzap command globally available

### Run Scripts Manually
You can manually run the Gitzap scripts for testing without installing globally.
- Create a new Git branch:
```bash
node scripts/gitzap.js create-branch
```
- Prune old Git branches:
```bash
node scripts/gitzap.js prune-branches
```

## Testing

There are currently no automated tests.
Testing is done manually by:

- Running the CLI (gitzap create-branch or gitzap prune-branches)
- Verifying that:
  - Branches are created correctly
  - Old branches are pruned as expected
  - Errors are handled gracefully (e.g., missing branches)

## Publishing to npm

If you have made changes and want to publish a new version to npm:

1. Make sure you are logged in to npm:
```bash
npm login
```
2. Update the version field in package.json according to [Semantic Versioning](https://semver.org/).
3. Run the publish command:
```bash
npm publish
```
Publishing automatically uses the files specified in the files array in package.json.

Important: Only bin/, scripts/, LICENSE, and README.md are included in the npm package. 

## Notes

- **fzf Dependency:**
    create-branch.sh depends on fzf for interactive branch type selection.
    If fzf is not installed, the script will prompt the user to install it via:
    - brew (macOS)
    - apt-get (Ubuntu/Debian)
    - yum (CentOS/Fedora)

- **Shell Compatibility:**
    Gitzap scripts are compatible with both bash and zsh environments.

- **Default Branch:**
    prune-branches.sh assumes the default branch is main.
    Users can override it when prompted during pruning.


---

# ✨ Quick Highlights:
- It’s well-structured with a **Table of Contents**.
- Clear sections for **setup**, **running scripts**, **testing**, **publishing**, and **important notes**.
- Professional and beginner-friendly tone.

---

Would you also like me to create a very small `CONTRIBUTING.md` next? (optional but good practice for npm/open-source projects.)  
It would just say how to contribute properly (issues/PRs) 🚀  
Want me to?
