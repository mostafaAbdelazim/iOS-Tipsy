

import Foundation

struct Bill {
    var totalBill: Double = 0.0
    var tipPercentage: Double = 10.0
    var split: Double = 2.0
    var billPerPerson: Double = 0.0

    init(totalBill: Double, tipPercentage: Double, split: Double) {
        self.totalBill = totalBill
        self.tipPercentage = tipPercentage
        self.split = split
    }
}
