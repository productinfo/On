import UIKit
import On

class ViewController: UIViewController {
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var searchBar: UISearchBar!

  var timer: Timer!

  override func viewDidLoad() {
    super.viewDidLoad()

    button.on.tap {
      self.label.text = self.textField.text
    }

    textField.on.text {
      print($0)
    }

    label.on.keyPath(#keyPath(UILabel.text)) {
      print($0)
    }

    slider.on.value {
      print($0)
    }

    searchBar.on.text {
      print($0)
    }

    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
    timer.on.tick {
      print($0)
    }
  }
}

