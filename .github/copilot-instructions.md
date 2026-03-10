# Copilot instructions for swift-calculator

## Documentation requirement (mandatory)
When you implement or change a feature:
1) Update `README.md` (or `CALCULATOR_README.md` if that remains the primary README).
2) Update `docs/index.html` to reflect the new feature and how to use it.

## What to include in docs updates
- Feature summary (what changed)
- How to use it (steps)
- Any edge cases / limitations
- Test instructions (how to verify)

## Guardrails
- Prefer business logic changes in `TestAppLatest/ViewModels/CalculatorViewModel.swift`.
- Keep UI changes in `TestAppLatest/Views/`.
- If you add buttons/operations, update `TestAppLatest/Models/CalculatorButton.swift`.