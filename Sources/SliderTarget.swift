import UIKit

public class SliderTarget: ControlTarget {
  var valueAction: FloatAction?

  override init(host: UIControl) {
    super.init(host: host)

    host.addTarget(self, action: #selector(handleValue(_:)), for: .valueChanged)
  }

  // MARK: - Action

  func handleValue(_ control: UIControl) {
    guard let slider = control as? UISlider else {
      fatalError()
    }

    valueAction?(slider.value)
  }

  // MARK: - Public

  func value(_ action: @escaping FloatAction) {
    self.valueAction = action
  }
}

extension UISlider {
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
