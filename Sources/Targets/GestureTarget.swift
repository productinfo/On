import UIKit

public class GestureTarget: NSObject {
  var occurAction: Action?

  init(host: UIGestureRecognizer) {
    super.init()

    host.addTarget(self, action: #selector(didOccur(_:)))
  }

  // MARK: - Action

  func didOccur(_ gestureRecognizer: UIGestureRecognizer) {
    occurAction?()
  }

  // MARK: - Public

  func occur(_ action: @escaping Action) {
    self.occurAction = action
  }
}

extension UIGestureRecognizer {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: GestureTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? GestureTarget {
        return value
      }

      let value = GestureTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
