import UIKit

public class ButtonTarget: ControlTarget {
  var tapAction: Action?

  override init(host: UIControl) {
    super.init(host: host)

    host.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
  }

  // MARK: - Action

  func handleTap() {
    tapAction?()
  }

  // MARK: - Public

  public func tap(_ action: @escaping Action) {
    self.tapAction = action
  }
}

public extension UIButton {
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
