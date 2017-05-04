import UIKit

public class TextFieldTarget: ControlTarget {
  var textAction: StringAction?

  override init(host: UIControl) {
    super.init(host: host)

    host.addTarget(self, action: #selector(handleText), for: .editingChanged)
  }

  // MARK: - Action

  func handleText(_ control: UIControl) {
    guard let textField = control as? UITextField else {
      fatalError()
    }

    textAction?(textField.text ?? "")
  }

  // MARK: - Public

  func text(_ action: @escaping StringAction) {
    self.textAction = action
  }
}

extension UITextField {
  private struct AssociatedKey {
    static var on = "on"
  }

  override var on: TextFieldTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? TextFieldTarget {
        return value
      }

      let value = TextFieldTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
