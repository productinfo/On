import Foundation

public class TimerTarget: NSObject {
  var fireAction: Action?

  // MARK: - Action

  func didFire() {
    fireAction?()
  }

  // MARK: - Public

  func fire(_ action: @escaping Action) {
    self.fireAction = action
  }
}

public extension Timer {
  static func scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool) -> Timer {
    let on = TimerTarget()
    let timer = Timer.scheduledTimer(timeInterval: interval,
                                     target: on,
                                     selector: #selector(TimerTarget.didFire),
                                     userInfo: nil,
                                     repeats: repeats)
    timer.on = on
    return timer
  }
}

extension Timer {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: TimerTarget {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? TimerTarget else {
        fatalError("Must use scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool)")
      }

      return value
    }

    set {
      objc_setAssociatedObject(self, &AssociatedKey.on, newValue as TimerTarget?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}
