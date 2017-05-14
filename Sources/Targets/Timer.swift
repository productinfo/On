import Foundation

public extension TargetContainer where T: Timer {

  func change(_ action: @escaping Action) {
    let target = TimerTarget(host: host, action: action)

    self.timerTarget = target
  }
}

class TimerTarget: NSObject {
  var action: Action?

  init(host: Timer, action: @escaping Action) {
    super.init()

    self.action = action
  }
}
