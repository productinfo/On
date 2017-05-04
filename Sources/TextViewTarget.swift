import UIKit

public class TextViewTarget: NSObject, UITextViewDelegate {
  var textAction: StringAction?

  init(host: UITextView) {
    super.init()
    host.delegate = self
  }

  // MARK: - UITextViewDelegate

  public func textViewDidChange(_ textView: UITextView) {
    textAction?(textView.text)
  }

  // MARK: - Public

  func text(_ action: @escaping StringAction) {
    self.textAction = action
  }
}

extension UITextView {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: TextViewTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? TextViewTarget {
        return value
      }

      let value = TextViewTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
