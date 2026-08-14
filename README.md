# homebrew-tap

Homebrew tap for [L337-org/docker-mcp-server](https://github.com/L337-org/docker-mcp).

## Status: paused

**This channel is not currently supported, and the formula in this tap is not up to date.**
`Formula/docker-mcp-server.rb` is frozen at 1.9.2 against a current release of
[v2.2.3](https://github.com/L337-org/docker-mcp/releases/latest). It is kept here as the record
of where the channel got to, not as something to install.

The pause is a linkage problem rather than a packaging oversight. Pre-built PyPI wheels for
`pydantic_core` are not built with `-headerpad_max_install_names`, so Homebrew's post-install
relocation step has no room in the Mach-O header to rewrite the `@rpath` ID to a longer absolute
path, and the install fails. The `skip_clean "libexec"` line in the formula was an attempt at
working around that.

## Installing docker-mcp-server

Use one of the supported channels instead:

- PyPI: `uvx docker-mcp-server`, or `pip install docker-mcp-server`
- Container image: `ghcr.io/l337-org/docker-mcp-server`
- Claude Desktop extension: the `.mcpb` attached to each
  [release](https://github.com/L337-org/docker-mcp/releases/latest)

See the [docker-mcp README](https://github.com/L337-org/docker-mcp#readme) for the full list and
for client configuration.

## Re-enabling this channel

The trigger lives in the docker-mcp repo, not here:
[publish-homebrew.yaml](https://github.com/L337-org/docker-mcp/blob/main/.github/workflows/publish-homebrew.yaml)
is `workflow_dispatch`-only, and `scripts/docker-mcp-server.rb.tpl` is the template this formula
is generated from. The steps are recorded in that repo's `CLAUDE.md` under "Homebrew tap".

Once the linkage issue is resolved and a release regenerates the formula, the install form is:

```bash
brew install l337-org/tap/docker-mcp-server
```

Homebrew 6.0+ needs that fully-qualified form to auto-trust this tap for the formula. After
`brew tap l337-org/tap`, the short form additionally needs
`brew trust --formula l337-org/tap/docker-mcp-server`.
