# homebrew-tap

Homebrew tap for [L337-org/docker-mcp-server](https://github.com/L337-org/docker-mcp).

## Usage

```bash
brew install l337-org/tap/docker-mcp-server
```

Then add to your MCP client configuration:

```json
{
  "mcpServers": {
    "docker-mcp-server": {
      "command": "docker-mcp-server",
      "args": [],
      "env": {}
    }
  }
}
```

> **Homebrew 6.0+ note:** The fully-qualified form above (`l337-org/tap/docker-mcp-server`) auto-trusts this tap for that formula. If you use the short form after `brew tap l337-org/tap`, run `brew trust --formula l337-org/tap/docker-mcp-server` first.

For full documentation see [github.com/L337-org/docker-mcp](https://github.com/L337-org/docker-mcp#readme).

---

The formula in this tap is maintained automatically by [publish-homebrew.yaml](https://github.com/L337-org/docker-mcp/blob/main/.github/workflows/publish-homebrew.yaml) — do not edit it by hand.
