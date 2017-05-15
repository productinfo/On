import Foundation

public extension Container where Host: NSObject {

  func observe(keyPath: String, _ action: @escaping AnyAction) {
    keyPathTarget.mapping[keyPath] = action
    host.addObserver(keyPathTarget, forKeyPath: keyPath, options: .new, context: nil)
  }

  func unobserve(keyPath: String) {
    _ = keyPathTarget.mapping.removeValue(forKey: keyPath)
    host.removeObserver(keyPathTarget, forKeyPath: keyPath)
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

    guard let value = change?[.newKey] else {
      return
    }

    action(value)
  }
}
