import UIKit

public class BarButtonItemTarget: NSObject {
  var tapAction: Action?

  init(host: UIBarButtonItem) {
    super.init()

    host.target = self
    host.action = #selector(handleTap)
  }

  // MARK: - Action

  func handleTap() {
    tapAction?()
  }

  // MARK: - Public

  func tap(_ action: @escaping Action) {
    self.tapAction = action
  }
}

extension UIBarButtonItem {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: BarButtonItemTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? BarButtonItemTarget {
        return value
      }

      let value = BarButtonItemTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
