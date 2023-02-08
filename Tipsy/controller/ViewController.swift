
import UIKit

class ViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!

    @IBOutlet var splitLabel: UILabel!
    @IBOutlet var firstBillButton: UIButton!
    @IBOutlet var secondTipButton: UIButton!
    @IBOutlet var thirdTipButton: UIButton!
    var billLogic = BillLogic()

    var split: Double = 0.0
    var tip: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateBill(_ sender: UIButton) {
        billLogic.calculateBillPerPerson(
            totalBill: Double(billTextField.text ?? "0.0")!,
            tipPercentage: tip,
            split: split)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    @IBAction func billSelected(_ sender: UIButton) {
        updateUI(sender.currentTitle!)
        tip = Double(sender.currentTitle?.trimmingCharacters(in: ["%"]) ?? "0.0")!
    }

    @IBAction func splitChanged(_ sender: UIStepper) {
        split = sender.value
        splitLabel.text = String(Int(split))
    }

    func updateUI(_ buttonTitle: String) {
        firstBillButton.isSelected = buttonTitle == firstBillButton.currentTitle!
        secondTipButton.isSelected = buttonTitle == secondTipButton.currentTitle!
        thirdTipButton.isSelected = buttonTitle == thirdTipButton.currentTitle!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.payPerPerson = billLogic.getBillPerPersonText()
            destinationVC.split = billLogic.getSplitText()
            destinationVC.tip = billLogic.getTipText()
        }
    }
}
