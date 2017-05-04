import UIKit

public class ControlTarget: NSObject {
  weak var host: UIControl?

  var tapBlock: Action?
  var changeBlock: Action?

  init(host: UIControl) {
    self.host = host
    super.init()

    host.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    host.addTarget(self, action: #selector(didTap), for: .valueChanged)
  }

  // MARK: - Action

  func didTap() {
    tapBlock?()
  }

  func didChange() {
    changeBlock?()
  }

  // MARK: - Public

  func tap(_ action: @escaping Action) {
    self.tapBlock = action
  }

  func change(_ action: @escaping Action) {
    self.changeBlock = action
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
