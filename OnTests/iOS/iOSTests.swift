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

    wait(for: 0.5)
    XCTAssertTrue(called)
  }

  func testKeyPath() {
    let observer = NSObject()
    let label = UILabel()

    var text: String?
    observer.on.observe(object: label, keyPath: #keyPath(UILabel.text), action: {
      text = $0 as? String
    })

    label.text = "hello"

    wait(for: 0.1)
    XCTAssertEqual(text, "hello")
  }
}
