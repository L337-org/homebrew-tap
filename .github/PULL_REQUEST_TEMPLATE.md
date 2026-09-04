## Summary

<!-- What does this change do, and why? -->

## Test plan

<!-- How did you verify this? There is no CI in this repository, so review plus whatever you ran
     by hand is the only check a change gets. Say what you ran, or say that nothing needed
     running and why. -->

## Checklist

- [ ] `Formula/*.rb` is unchanged - or, if it is a hand-verified stopgap, the same fix has landed in `docker-mcp`'s `scripts/docker-mcp-server.rb.tpl`, because a release regenerates the formula and silently reverts anything fixed only here
- [ ] If a formula did change: `brew install ./Formula/<name>.rb` (with `--build-from-source`, unless the formula fetches a prebuilt asset), `brew test <name>` and `brew audit --strict --online ./Formula/<name>.rb` all pass on the platform the change targets
- [ ] If this changes how the channel is described or re-enabled: `README.md` and `.github/copilot-instructions.md` agree with each other, and neither points at a heading in another repository that no longer exists
