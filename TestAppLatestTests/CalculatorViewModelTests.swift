import XCTest
@testable import TestAppLatest

class CalculatorViewModelTests: XCTestCase {
    var viewModel: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CalculatorViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func tap(_ buttons: [CalculatorButton]) {
        for button in buttons {
            viewModel.buttonTapped(button)
        }
    }

    func testAddition() {
        tap([.two, .add, .three, .equal])
        XCTAssertEqual(viewModel.display, "5")
    }

    func testSubtraction() {
        tap([.five, .subtract, .three, .equal])
        XCTAssertEqual(viewModel.display, "2")
    }

    func testMultiplication() {
        tap([.four, .multiply, .three, .equal])
        XCTAssertEqual(viewModel.display, "12")
    }

    func testDivision() {
        tap([.eight, .divide, .two, .equal])
        XCTAssertEqual(viewModel.display, "4")
    }

    func testDivisionByZero() {
        tap([.eight, .divide, .zero, .equal])
        XCTAssertEqual(viewModel.display, "0")
    }

    func testPercent() {
        tap([.five, .zero, .percent])
        XCTAssertEqual(viewModel.display, "0.5")
    }

    func testNegative() {
        tap([.five, .negative])
        XCTAssertEqual(viewModel.display, "-5")
    }

    func testClear() {
        tap([.seven, .add, .three, .clear])
        XCTAssertEqual(viewModel.display, "0")
    }

    func testDecimalInput() {
        tap([.one, .decimal, .two, .add, .two, .decimal, .eight, .equal])
        XCTAssertEqual(viewModel.display, "4")
    }

    func testMultipleDecimals() {
        tap([.one, .decimal, .decimal, .two])
        XCTAssertEqual(viewModel.display, "1.2")
    }

    func testLeadingZeros() {
        tap([.zero, .zero, .five])
        XCTAssertEqual(viewModel.display, "5")
    }

    func testMaxDigits() {
        tap([.one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero])
        XCTAssertEqual(viewModel.display.count, 9)
    }

    func testChainedOperations() {
        tap([.two, .add, .three, .add, .four, .equal])
        XCTAssertEqual(viewModel.display, "9")
    }

    func testNegativeZero() {
        tap([.zero, .negative])
        XCTAssertEqual(viewModel.display, "0")
    }
}
