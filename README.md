
# GitZap

GitZap is a command-line tool that helps automate Git workflows, such as creating branches based on ticket types and pruning old branches. It provides a set of simple, customizable scripts to streamline your development process.

## Features

- Create branches based on ticket types (e.g., `feat`, `fix`, `chore`).
- Interactive selection of ticket types using `fzf`.
- Prune old local branches with a custom pruning script.
- Customizable script paths and configurations.

## Directory Structure

```
.
├── LICENSE
├── README.md
├── bin
│   └── install.js
├── package-lock.json
├── package.json
└── scripts
    ├── create-branch.sh
    ├── gitzap.js
    └── prune-branches.sh
```

### Explanation:

- **`bin/install.js`**: A script to install the tool by setting up the environment and copying the required scripts to your home directory.
- **`scripts/create-branch.sh`**: A shell script that helps create new branches based on the selected ticket type.
- **`scripts/gitzap.js`**: A Node.js script that serves as the entry point for the command-line tool.
- **`scripts/prune-branches.sh`**: A shell script for pruning old, merged branches from your local repository.

## Installation

To install GitZap locally, follow these steps:

1. Clone this repository or download the files.
2. Run the following command to install dependencies:
   ```bash
   npm install
   ```
3. To install GitZap globally for use, run:
   ```bash
   npm run install
   ```

This will:
- Install necessary scripts into the `~/.gitzap/` directory.
- Add the installation directory to your system's `PATH`.
- Allow you to run the command `gitzap` from anywhere.

## Usage

After installation, you can use the `gitzap` CLI to create a new Git branch based on a ticket ID and type.

### Creating a Branch

To create a new branch, run:

```bash
gitzap create-branch
```

You will be prompted to:
1. Select a ticket type (`feat`, `fix`, `chore`).
2. Enter the ticket ID (e.g., `1234`).
3. Optionally, enter a short description.

GitZap will:
- Create a new Git branch using the format `ticket-type/ticket-id/short-description`.
- Switch to the newly created branch.
- Prune any old branches (via the `prune-branches.sh` script).

### Pruning Branches

GitZap also includes a script to prune old branches that are no longer needed. This is automatically triggered when creating a new branch. You can manually execute it by running:

```bash
bash ~/.gitzap/prune-branches.sh
```

This script:
1. Switches to the branch you specify (default is `main`).
2. Fetches updates with the `--prune` option.
3. Removes local branches that have been merged into the current branch.

## Development

To run tests locally or make changes to the code, you can follow these steps:

1. Install dependencies:
   ```bash
   npm install
   ```

2. Run the test script to ensure everything works correctly:
   ```bash
   npm run test
   ```

3. If you make changes to the scripts, you can test them locally by running:
   ```bash
   node tests/create-branch.js
   ```

4. For publishing the package, make sure you follow the [npm publish guidelines](https://docs.npmjs.com/cli/v7/commands/npm-publish).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.