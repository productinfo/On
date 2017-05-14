import UIKit

public extension TargetContainer where T: UISlider {

  func value(_ action: @escaping FloatAction) {
    let target = SliderTarget(host: host, action: action)

    self.sliderTarget = target
  }
}

class SliderTarget: NSObject {
  var action: FloatAction?

  init(host: UISlider, action: @escaping FloatAction) {
    super.init()

    host.addTarget(self, action: #selector(handleChange(_:)), for: .valueChanged)
  }

  // MARK: - Action

  func handleChange(_ slider: UISlider) {
    action?(slider.value)
  }
}
