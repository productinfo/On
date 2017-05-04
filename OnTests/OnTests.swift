import XCTest
import On

class OnTests: XCTestCase {

  func testButton() {
    let button = UIButton()

    var called = false
    button.on.tap {
      called = true
    }

    button.sendActions(for: .touchUpInside)

    wait(for: 0.1)
    XCTAssertTrue(called)
  }
}
