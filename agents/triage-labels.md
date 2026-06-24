# Triage Labels

The skills speak in terms of five canonical triage roles. This file maps those roles to the actual strings used in this repo's issue tracker.

Because issues live as local markdown (see `issue-tracker.md`), a role is recorded as the `Status:` line value near the top of each issue file rather than as a tracker label.

| Canonical role    | Status string in our files | Meaning                                  |
| ----------------- | -------------------------- | ---------------------------------------- |
| `needs-triage`    | `needs-triage`             | Maintainer needs to evaluate this issue  |
| `needs-info`      | `needs-info`               | Waiting on reporter for more information |
| `ready-for-agent` | `ready-for-agent`          | Fully specified, ready for an AFK agent  |
| `ready-for-human` | `ready-for-human`          | Requires human implementation            |
| `wontfix`         | `wontfix`                  | Will not be actioned                     |

When a skill mentions a role (e.g. "apply the AFK-ready triage label"), set the `Status:` line to the corresponding string from this table.

Edit the right-hand column to match whatever vocabulary you actually use.
