
import Foundation

struct BillLogic {
    var bill: Bill?

    mutating func calculateBillPerPerson(totalBill: Double, tipPercentage: Double, split: Double) {
        bill = Bill(totalBill: totalBill, tipPercentage: tipPercentage, split: split)
        bill!.billPerPerson = (bill!.totalBill + (bill!.totalBill * bill!.tipPercentage) / 100) / bill!.split
    }

    func getBillPerPersonText
    () -> String {
        return String(format: "%.2f", bill!.billPerPerson)
    }

    func getSplitText
    () -> String {
        return String(format: "%.0f", bill!.split)
    }

    func getTipText
    () -> String {
        return String(format: "%.0f", bill!.tipPercentage)
    }
}
