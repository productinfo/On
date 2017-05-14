import UIKit

public class KeyPathTarget: NSObject {
  weak var host: NSObject?
  var keyPathActions = [String: AnyAction]()

  init(host: NSObject) {
    self.host = host
    super.init()
  }

  // MARK: - Observe

  public override func observeValue(forKeyPath keyPath: String?,
                                    of object: Any?,
                                    change: [NSKeyValueChangeKey : Any]?,
                                    context: UnsafeMutableRawPointer?) {
    guard let keyPath = keyPath else {
      return
    }

    guard let action = keyPathActions[keyPath] else {
      return
    }

    action(change)
  }

  // MARK: - Public

  func observe(keyPath: String) {
    guard let host = host else {
      return
    }

    host.addObserver(self, forKeyPath: keyPath, options: .new, context: nil)
  }

  func unobserve(keyPath: String) {
    guard let host = host else {
      return
    }

    host.removeObserver(self, forKeyPath: keyPath)
  }
}

extension UIViewController {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: KeyPathTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? KeyPathTarget {
        return value
      }

      let value = KeyPathTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
