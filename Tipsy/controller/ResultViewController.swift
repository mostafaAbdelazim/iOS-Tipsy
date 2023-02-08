
import UIKit

class ResultViewController: UIViewController {
    var payPerPerson: String = "0.0"
    var split: String = "1"
    var tip: String = "0.0"

    @IBOutlet var billLabel: UILabel!

    @IBOutlet var billDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        billLabel.text = payPerPerson
        billDescription.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
