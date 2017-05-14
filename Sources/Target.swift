import UIKit

public class TargetContainer<T: NSObject>: NSObject {
  let host: T

  init(host: T) {
    self.host = host
  }

  var controlTarget: ControlTarget?
}

public extension NSObject {
  private struct AssociatedKey {
    static var key = "NSObject"
  }

  var on: TargetContainer<NSObject> {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.key) as? TargetContainer {
        return value
      }

      let value = TargetContainer(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
