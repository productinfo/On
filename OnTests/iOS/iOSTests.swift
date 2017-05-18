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
    observer.on.observe(object: label, keyPath: #keyPath(UILabel.text)) {
      text = $0 as? String
    }

    label.text = "hello"

    wait(for: 0.1)
    XCTAssertEqual(text, "hello")
  }

  func testNotification() {
    let observer = NSObject()

    var text: String?
    observer.on.observe(notification: Notification.Name("test")) {
      text = $0.userInfo?["key"] as? String
    }

    NotificationCenter.default.post(name: Notification.Name("test"), object: nil, userInfo: ["key": "value"])

    wait(for: 0.1)
    XCTAssertEqual(text, "value")
  }
}
