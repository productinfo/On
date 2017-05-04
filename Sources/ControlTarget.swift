import UIKit

public class ControlTarget: NSObject {
  var changeAction: Action?

  init(host: UIControl) {
    super.init()

    host.addTarget(self, action: #selector(handleChange), for: .valueChanged)
  }

  // MARK: - Action

  func handleChange() {
    changeAction?()
  }

  // MARK: - Public

  func change(_ action: @escaping Action) {
    self.changeAction = action
  }
}

extension UIControl {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: ControlTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? ControlTarget {
        return value
      }

      let value = ControlTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
