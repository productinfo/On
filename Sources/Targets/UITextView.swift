import UIKit

public extension TargetContainer where T: UITextView {

  func text(_ action: @escaping StringAction) {
    let target = TextViewTarget(host: host, action: action)
    self.textViewTarget = target
  }
}

class TextViewTarget: NSObject, UITextViewDelegate {
  var action: StringAction?

  init(host: UITextView, action: @escaping StringAction) {
    super.init()

    self.action = action
    host.delegate = self
  }

  // MARK: - UITextViewDelegate

  func textViewDidEndEditing(_ textView: UITextView) {
    action?(textView.text ?? "")
  }
}
