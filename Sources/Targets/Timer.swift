import Foundation

public extension TargetContainer where T: Timer {

  func tick(_ action: @escaping Action) {
    self.timerTarget?.action = action
  }
}

class TimerTarget: NSObject {
  var action: Action?

  func didFire() {
    action?()
  }
}

public extension Timer {
  static func scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool) -> Timer {
    let target = TimerTarget()
    let timer = Timer.scheduledTimer(timeInterval: interval,
                                     target: target,
                                     selector: #selector(TimerTarget.didFire),
                                     userInfo: nil,
                                     repeats: repeats)
    timer.on.timerTarget = target
    return timer
  }
}
