import UIKit

public extension Container where Host: NSObject {

  func observe(notification name: Notification.Name, _ object: Any? = nil,
               _ action: @escaping NotificationAction) {
    let observer = NotificationCenter.default.addObserver(
      forName: name, object: object,
      queue: OperationQueue.main, using: {
        action($0)
      })

    notificationTarget.observers.append(observer)
  }

  func unobserve(notification name: Notification.Name, _ object: Any? = nil) {
    
  }
}

class NotificationTarget: NSObject {
  var observers: [NSObjectProtocol] = []
}
