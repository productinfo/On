import UIKit
import On
import Anchors

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    button()
    textField()
  }

  func button() {
    let button = UIButton()
    button.setTitle("Click", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    view.addSubview(button)

    activate(button.anchor.center)

    button.on.tap({
      self.view.subviews.forEach({
        if let view = $0 as? UITextField {
          print(view.delegate)
        }
      })
    })
  }

  func textField() {
    let textField = UITextField()
    textField.textColor = .black
    textField.borderStyle = .line
    view.addSubview(textField)

    activate(
      textField.anchor.width.constant(40),
      textField.anchor.centerX,
      textField.anchor.centerY.constant(20)
    )

    textField.on.text({
      print($0)
    })

    textField.on.keyPath(#keyPath(UITextField.text), {
      print($0)
    })
  }
}

