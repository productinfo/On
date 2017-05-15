import UIKit

public extension Container where Host: UIGestureRecognizer {

  func occur(_ action: @escaping Action) {
    let target = GestureTarget(host: host, action: action)
    self.gestureTarget = target
  }
}

class GestureTarget: NSObject {
  var action: Action?

  init(host: UIGestureRecognizer, action: @escaping Action) {
    super.init()

    self.action = action
    host.addTarget(self, action: #selector(didOccur(_:)))
  }

  // MARK: - Action

  func didOccur(_ gestureRecognizer: UIGestureRecognizer) {
    action?()
  }
}