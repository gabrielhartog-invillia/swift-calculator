name: Agent Implementation - Plan (Copilot)

on:
  issues:
    types: [labeled]

permissions:
  issues: write

concurrency:
  group: agent-implementation-plan-${{ github.event.issue.number }}
  cancel-in-progress: false

jobs:
  plan:
    if: ${{ contains(github.event.issue.labels.*.name, 'agent:implement') }}
    runs-on: ubuntu-latest
    steps:
      - name: Validate issue has body
        uses: actions/github-script@v7
        with:
          script: |
            const body = (context.payload.issue.body || "").trim();
            if (!body) {
              await github.rest.issues.createComment({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: context.payload.issue.number,
                body: [
                  "Cannot start agent planning: issue body is empty.",
                  "",
                  "Please edit the issue and add:",
                  "- Problem statement",
                  "- Acceptance criteria (checklist)",
                  "- Notes / constraints (optional)"
                ].join("\n")
              });
              core.setFailed("Issue body is empty");
            }

      - name: Post implementation plan prompt (for Copilot)
        uses: actions/github-script@v7
        with:
          script: |
            const issue = context.payload.issue;
            const issue_number = issue.number;

            const plan = [
              "## Copilot Implementation Plan (MVP)",
              "",
              "**Goal:** Implement the feature described in this issue and open a PR.**",
              "",
              "### Definition of Done (mandatory)",
              "- [ ] `README.md` updated to reflect the change",
              "- [ ] `docs/index.html` updated to reflect the change",
              "",
              "### Inputs",
              `- Issue: #${issue_number} — ${issue.title}`,
              "",
              "### Repo architecture hints (swift-calculator)",
              "- Views:",
              "  - `TestAppLatest/Views/ContentView.swift`",
              "  - `TestAppLatest/Views/CalculatorButtonView.swift`",
              "- ViewModel:",
              "  - `TestAppLatest/ViewModels/CalculatorViewModel.swift`",
              "- Model:",
              "  - `TestAppLatest/Models/CalculatorButton.swift`",
              "",
              "### Required plan output (fill this before coding)",
              "- Summary",
              "- Acceptance Criteria (as a checklist)",
              "- Approach",
              "- Files to change (exact paths)",
              "- Test plan",
              "- Docs changes (must include README.md + docs/index.html)",
              "",
              "### Next step",
              "Maintainer: after reviewing this plan, assign Copilot coding agent to this issue to implement."
            ].join("\n");

            await github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number,
              body: plan
            });