import UIKit

public class DatePickerTarget: ControlTarget {
  var pickAction: DateAction?

  // MARK: - Action

  override func handleChange(_ control: UIControl) {
    if let picker = control as? UIDatePicker {
      pickAction?(picker.date)
    }
  }

  // MARK: - Public

  func pick(_ action: @escaping DateAction) {
    self.pickAction = action
  }
}

extension UIDatePicker {
  private struct AssociatedKey {
    static var on = "on"
  }

  override var on: DatePickerTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? DatePickerTarget {
        return value
      }

      let value = DatePickerTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
