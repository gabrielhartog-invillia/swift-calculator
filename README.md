# iOS Calculator App

A modern, iOS-inspired calculator built with SwiftUI and MVVM. This project focuses on clean architecture, a familiar calculator experience, and a polished UI.

## Features

- Basic operations: addition, subtraction, multiplication, division
- Utility functions: clear (AC), percent, toggle sign, decimal support
- Chained operations with proper display formatting
- Large, readable display with responsive scaling
- Touch-friendly, color-coded buttons

## Architecture

The app uses MVVM to keep UI and business logic separated:

- Model: `CalculatorButton` enum defines button types and styling
- ViewModel: `CalculatorViewModel` handles state and calculation logic
- Views: `ContentView` and `CalculatorButtonView` render the UI

## Project Structure

- `Models/` - Button definitions and types
- `ViewModels/` - Calculator state and logic
- `Views/` - SwiftUI views for the interface

## Getting Started

Requirements:

- Xcode 12 or later
- iOS 14 or later

Run locally:

1. Open `TestAppLatest.xcodeproj` in Xcode
2. Select a simulator or device
3. Build and run with Cmd + R

## Design Notes

- iOS calculator-inspired layout and colors
- 5x4 grid with 12pt spacing
- 80pt display, 35pt button labels
- Double-width zero button

## Future Ideas

- Button press animations and haptics
- Scientific mode
- History tape
- Accessibility enhancements
