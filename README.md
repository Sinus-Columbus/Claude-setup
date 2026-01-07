# Info

Dette er en arbejds klar version af et personligt setup til mit workflow med AI agenter.
Du kan se flere use cases som implementation af MCP eller andre Claude commands i filerne "use-cases" eller "claude-code-full-guide" i det originale repo.

## Hurtig vejledning: KopiA©r agent-setup til et andet repo

FAlg disse trin for at bruge `sync-agent-kit.ps1` til at kopiere alle agent-relaterede filer (AGENTS.md, CLAUDE.md, CLAUDE-example.md, `.claude/mcp.servers.json`, `.claude/commands/`) til et andet repo uden at klone dette:

1. Åbn PowerShell.
2. Gå til denne repos rod:
   ```powershell
   cd "C:\Users\sinus\OneDrive\Documents\GitHub\Claude-setup"
   ```
3. Kør scriptet med destinationen til det andet repo:
   ```powershell
   .\sync-agent-kit.ps1 -Destination "C:\path\til\andet-repo"
   ```
4. Hvis du vil overskrive eksisterende filer i mAA¥lrepositoriet, tilfAA,y `-Overwrite`:
   ```powershell
   .\sync-agent-kit.ps1 -Destination "C:\path\til\andet-repo" -Overwrite
   ```
5. Scriptet opretter nødvendige mapper og kopierer filerne. Tjek i målrepositoriet, at filerne ligger på samme stisider som her.

Bemærk:
- Scriptet kræver PowerShell og adgang til destinationsstien.
- Juster efter behov, hvis du vil kopiere ekstra filer (f.eks. PRP-skabeloner) ved at opdatere `sync-agent-kit.ps1`.

### Hvilke filer kopieres?
- `AGENTS.md`: Fælles agentguide til alle agenter.
- `CLAUDE.md`: Kort pointer til AGENTS.md (bagudkompatibilitet).
- `CLAUDE-example.md`: Eksempel på detaljeret agentdokument.
- `.claude/mcp.servers.json`: Fælles MCP server-konfiguration.
- `.claude/commands/`: Universelle commands (generate-prp, execute-prp, ultimate_validate_command) til alle agenter.
- `examples/`: Eksempelfiler til workflows.
- `PRPs/`: PRP-workflow og skabeloner (inkl. `PRPs/templates/`).
