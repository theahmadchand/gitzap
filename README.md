# Gitzap ⚡️

Gitzap is a command-line tool that helps automate Git workflows. It provides a set of simple, customizable scripts to streamline your development process.

## Features

- Create branches based on ticket types (e.g., `feat`, `fix`, `chore`).
- Interactive selection of ticket types.
- Prune old local branches with a custom pruning script.
- Simple setup with easy global installation.

## Installation

To install Gitzap locally:

```bash
npm install -g gitzap
```

## Usage
After installation, you can use the `gitzap` CLI.

### Creating a New Branch

```bash
gitzap create-branch
```

You will be prompted to:
1. Select a ticket type (feat, fix, chore, etc.).
2. Enter the ticket ID.
3. Optionally, add a short description.

Gitzap will:
- Create a branch with the format: ticket-type/ticket-id/short-description
- Switch to the new branch.
- Prune old branches automatically.

### Pruning Old Branches Manually
You can manually prune old merged branches:

```bash
gitzap prune-branches
```

This will:
- Switch to your main branch (default main).
- Fetch and prune remote-tracking branches.
- Delete local branches already merged.

## License
This project is licensed under the BSD 3-Clause License - see the [LICENSE](/LICENSE) file for details.