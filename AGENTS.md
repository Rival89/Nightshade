# Nightshade — Contributor & Agent Guide

*Last updated: 2025‑07‑30*

## 📁 Repository Layout

```
/                 # repo root
├─ setup.sh       # runs before every Codex task
├─ AGENTS.md      # this guide
└─ nightshade/
    ├─ nightshade.sh        # interactive menu (main entrypoint)
    ├─ modules/             # numbered task scripts (00_,10_,…)
    ├─ logs/                # runtime logs
    ├─ temp/                # scratch files
    └─ tests/               # BATS unit tests
```

Agents must work only inside `nightshade/` unless told otherwise.

## 🛠️ Development Standards

| Topic            | Rule                                              |
| ---------------- | ------------------------------------------------- |
| Shell dialect    | `#!/usr/bin/env bash` + `set -euo pipefail`       |
| Formatting       | `shfmt -i 2 -ci`                                  |
| Linting          | `shellcheck -x` must pass                         |
| Module filenames | Prefix numbers (`20_enum.sh`)                     |
| Idempotence      | Scripts safe for repeated runs                    |
| Secrets          | Never commit creds; load from `~/.nightshade_api` |

## 🧪 Validation Checklist

```bash
# format & lint
shfmt -d $(git ls-files '*.sh')
shellcheck -x $(git ls-files '*.sh')

# run all unit tests
bats nightshade/tests
```

All steps must be green before proposing a PR.

## 🤖 Agent Workflow

1. **Read context**: skim relevant files & recent commits.
2. **Plan**: outline intent in PR description before coding.
3. **Implement**: edit or create files in `nightshade/`.
4. **Validate**: run checklist above; update docs if needed.
5. **PR message template**

```
[Nightshade] <concise title>

### Summary
* <what & why>

### Validation
* shfmt / shellcheck: pass
* bats tests: pass
```

## 🚧 Migration Tracking

| Area                   | Status         |
| ---------------------- | -------------- |
| Pre‑op & Recon modules | ✅ Done         |
| Enumeration            | 🔄 In‑progress |
| Priv‑Esc & Reporting   | ⏳ Pending      |

Focus on one migration slice per PR.

## 💬 Help

Open an issue or add questions to the PR description—maintainers respond daily.
