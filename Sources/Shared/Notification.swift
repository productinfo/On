import UIKit

public extension Container where Host: NSObject {

  func observe(notification name: Notification.Name,
               _ action: @escaping NotificationAction) {
    let observer = NotificationCenter.default.addObserver(
      forName: name, object: nil,
      queue: OperationQueue.main, using: {
        action($0)
      })

    notificationTarget.mapping[name] = observer
  }

  func unobserve(notification name: Notification.Name) {
    let observer = notificationTarget.mapping.removeValue(forKey: name)

    if let observer = observer {
      NotificationCenter.default.removeObserver(observer as Any)
    }
  }
}

class NotificationTarget: NSObject {
  var mapping: [Notification.Name: NSObjectProtocol] = [:]
}
