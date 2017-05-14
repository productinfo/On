import UIKit

public extension TargetContainer where T: UITextField {

  func text(_ action: @escaping StringAction) {
    let target = TextFieldTarget(host: host, action: action)
    self.textFieldTarget = target
  }
}

class TextFieldTarget: NSObject, UITextFieldDelegate {
  var action: StringAction?

  init(host: UITextField, action: @escaping StringAction) {
    super.init()

    self.action = action
    host.delegate = self
  }

  // MARK: - UITextFieldDelegate

  func textFieldDidEndEditing(_ textField: UITextField) {
    action?(textField.text ?? "")
  }
}
