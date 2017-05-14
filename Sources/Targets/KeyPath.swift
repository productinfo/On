import UIKit

public extension TargetContainer where T: NSObject {

  func keyPath(_ keyPath: String, _ action: @escaping AnyAction) {
    keyPathTarget.mapping[keyPath] = action
    keyPathTarget.addObserver(keyPathTarget, forKeyPath: keyPath, options: .new, context: nil)
  }
}

class KeyPathTarget: NSObject {
  // keyPath: AnyAction
  var mapping: [String: AnyAction] = [:]

  override func observeValue(forKeyPath keyPath: String?,
                                    of object: Any?,
                                    change: [NSKeyValueChangeKey : Any]?,
                                    context: UnsafeMutableRawPointer?) {
    guard let keyPath = keyPath else {
      return
    }

    guard let action = mapping[keyPath] else {
      return
    }

    action(change)
  }
}
