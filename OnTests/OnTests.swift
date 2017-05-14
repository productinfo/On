import XCTest
import On

class OnTests: XCTestCase {

  func testButton() {
    let button = UIButton()

    var called = false
//    button.on.tap {
//      called = true
//    }

    button.sendActions(for: .touchUpInside)

    wait(for: 0.1)
    XCTAssertTrue(called)
  }

  func testKeyPath() {
    let label = UILabel()

    var text: String?
    label.on.keyPath("text", {
      text = $0 as? String
    })

    label.text = "hello"

    wait(for: 0.1)
    XCTAssertEqual(text, "hello")
  }
}
