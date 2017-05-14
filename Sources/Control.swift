import UIKit

public extension TargetContainer where T: UIControl {

  func change(_ action: @escaping Action) {
    let target = ControlTarget(host: host, action: action)

    self.controlTarget = target
  }
}

class ControlTarget: NSObject {
  var action: Action?

  init(host: UIControl, action: @escaping Action) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(handleChange(_:)), for: .valueChanged)
  }

  // MARK: - Action

  func handleChange(_ control: UIControl) {
    action?()
  }
}

