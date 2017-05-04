import UIKit

public class ButtonTarget: ControlTarget {
  var tapBlock: Action?

  override init(host: UIControl) {
    super.init(host: host)

    host.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
  }

  // MARK: - Action

  func handleTap() {
    tapBlock?()
  }

  // MARK: - Public

  func tap(_ action: @escaping Action) {
    self.tapBlock = action
  }
}

extension UIButton {
  private struct AssociatedKey {
    static var on = "on"
  }

  override var on: ButtonTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? ButtonTarget {
        return value
      }

      let value = ButtonTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
