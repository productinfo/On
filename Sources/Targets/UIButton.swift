import UIKit

public extension TargetContainer where T: UIButton {

  func tap(_ action: @escaping Action) {
    let target = ButtonTarget(host: host, action: action)
    self.buttonTarget = target
  }
}

class ButtonTarget: NSObject {
  var action: Action?

  init(host: UIButton, action: @escaping Action) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
  }

  // MARK: - Action

  func handleTap() {
    action?()
  }
}
