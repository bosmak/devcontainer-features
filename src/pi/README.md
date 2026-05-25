# Pi Coding Agent (pi)

Installs pi, the minimal terminal coding agent harness. Mounts host ~/.pi/agent into the container to share settings, sessions, extensions, skills, and themes.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/bosmak/devcontainer-features/pi:1": {}
}
```

With a pinned pi version:

```json
"features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/bosmak/devcontainer-features/pi:1": {
        "version": "0.75.5"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|------------|-------------|------|---------------|
| version | Version of `@earendil-works/pi-coding-agent` to install. Use `latest` for the most recent release, or pin to a specific semver (e.g. `0.75.5`). | string | latest |

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

## Authentication

Set your API key before using pi:

```bash
export ANTHROPIC_API_KEY=sk-ant-...
```

Or launch pi and use `/login` to authenticate via OAuth with supported providers (Anthropic, OpenAI, GitHub Copilot).

## Customization

- **Skills**: `.pi/skills/` — [Agent Skills standard](https://agentskills.io)
- **Extensions**: `.pi/extensions/` — TypeScript modules for custom tools and UI
- **Prompt Templates**: `.pi/prompts/` — Reusable Markdown prompts
- **Themes**: `.pi/themes/` — Terminal color themes
- **Pi Packages**: Install with `pi install npm:@scope/package`

See the [pi docs](https://pi.dev) for full details.

## Requirements

- Node.js (the `installsAfter` property ensures the `node` feature runs first)
- The host `~/.pi/agent` directory is bind-mounted; create it on the host if it doesn't exist (pi will populate it on first run)


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/bosmak/devcontainer-features/blob/main/src/pi/devcontainer-feature.json). Add additional notes to a `NOTES.md`._
