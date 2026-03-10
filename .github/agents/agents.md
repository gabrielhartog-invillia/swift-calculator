# Project Context

## Overview

- SwiftUI app targeting iPhone and iPad
- Minimum deployment: iOS 14 (per current project settings)
- Swift 5.x
- Uses SwiftUI throughout - no UIKit unless absolutely necessary

## Architecture

- MVVM with `ObservableObject` ViewModels
- Views own their ViewModel as a `@StateObject` property
- ViewModels handle all business logic - Views are declarative only
- Use NavigationStack where applicable
- Dependency injection through the SwiftUI Environment
- Use AppStorage for simple user preferences
- No persistent storage layer currently required

## Build System
- Use Xcode build/run
- Previews are available via Xcode
- SPM for package management - no CocoaPods
- Build target: "TestAppLatest" iOS

## Testing
- Use XCTest
- Test target: TestAppLatestTests
- Run tests from Xcode or command line


## Documentation & APIs
- Verify Apple API names with official docs
- Prefer async/await where it fits the project target and APIs
- Use structured concurrency where appropriate
- Error handling: use typed throws where supported

## Code Style
- All new views must include a #Preview block
- Use SF Symbols for icons - reference by exact name
- File organization: one type per file
- Naming: PascalCase for types, camelCase for properties
- Keep current folder structure by type
