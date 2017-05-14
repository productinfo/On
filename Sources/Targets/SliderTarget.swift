import UIKit

public class SliderTarget: ControlTarget {
  var valueAction: FloatAction?

  // MARK: - Action

  override func handleChange(_ control: UIControl) {
    if let slider = control as? UISlider {
      valueAction?(slider.value)
    }
  }

  // MARK: - Public

  func value(_ action: @escaping FloatAction) {
    self.valueAction = action
  }
}

public extension UISlider {
  private struct AssociatedKey {
    static var on = "on"
  }

  override var on: SliderTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? SliderTarget {
        return value
      }

      let value = SliderTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
