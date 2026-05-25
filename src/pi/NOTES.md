## What Gets Installed

- The `pi` CLI binary globally via npm (`@earendil-works/pi-coding-agent`)
- Global npm prefix configured to `/usr/local/share/npm-global`
- Host `~/.pi/agent` bind-mounted into the container at `/usr/local/share/pi-agent-config`, so settings, sessions, extensions, skills, prompts, themes, and packages are shared between host and container
- `PI_CODING_AGENT_DIR` set to the shared mount point

## Usage After Install

```bash
# Start interactive mode
pi

# Print mode (non-interactive)
pi -p "What files are in this directory?"

# Continue most recent session
pi -c

# Use a specific model
pi --model claude-sonnet-4-20250514 "Refactor this code"
```

## Requirements

- Node.js
- The host `~/.pi/agent` directory is bind-mounted; create it on the host if it doesn't exist (pi will populate it on first run)
