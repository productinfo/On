import UIKit
import On

class ViewController: UIViewController {

  @IBOutlet weak var goodSwitch: UISwitch!
  @IBOutlet weak var cheapSwitch: UISwitch!
  @IBOutlet weak var fastSwitch: UISwitch!

  override func viewDidLoad() {
    super.viewDidLoad()

    let good = self.goodSwitch!
    let cheap = self.cheapSwitch!
    let fast = self.fastSwitch!

    func allOn() -> Bool {
      return [good, cheap, fast].filter({ $0.isOn }).count == 3
    }

    good.on.change {
      if allOn() {
        fast.setOn(false, animated: true)
      }
    }

    cheap.on.change {
      if allOn() {
        good.setOn(false, animated: true)
      }
    }

    fast.on.change {
      if allOn() {
        cheap.setOn(false, animated: true)
      }
    }
  }
}
