
import UIKit

class ViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!

    @IBOutlet var splitLabel: UILabel!
    @IBOutlet var firstBillButton: UIButton!
    @IBOutlet var secondTipButton: UIButton!
    @IBOutlet var thirdTipButton: UIButton!
    var billLogic = BillLogic()

    var split: Double = 2.0
    var tip: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(firstBillButton)
    }

    @IBAction func calculateBill(_ sender: UIButton) {
        billLogic.calculateBillPerPerson(
            totalBill: Double(billTextField.text ?? "0.0")!,
            tipPercentage: tip,
            split: split)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    @IBAction func billSelected(_ sender: UIButton) {
        updateUI(sender)
        tip = Double(sender.currentTitle?.dropLast() ?? "0.0")!
    }

    @IBAction func splitChanged(_ sender: UIStepper) {
        split = sender.value
        splitLabel.text = String(format: "%.0f", split)
    }

    func updateUI(_ button: UIButton) {
        firstBillButton.isSelected = false
        secondTipButton.isSelected = false
        thirdTipButton.isSelected = false
        button.isSelected = true
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
