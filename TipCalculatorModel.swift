//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jakob Rydén on 16/07/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//

import Foundation

class TipCalculatorModel
{
    var total: Double
    var percent: Double

    var subtotal: Double {
    get {
        return total / (percent+1)
    }
    set(newSubtotal) {
        //...
    }
    }

    init(total:Double, percent:Double)
    {
        self.total = total
        self.percent = percent
    }

    func calcTip(tipPct:Double) -> (tip:Double, total:Double)
    {
        let tipAmount =  subtotal*tipPct
        let newTotal = subtotal+tipAmount
        return (tipAmount, newTotal)
    }
    func calcTipAmount(tipPct:Double) -> Double
    {
        return subtotal*tipPct
    }
    

    func printTips()
    {
        let possibleTips:[Double] = [0.15, 0.18, 0.20]
        for possibleTip in possibleTips {
            println("\(possibleTip*100)%: \(calcTip(possibleTip))")
        }

    }

    // note: [Int: Double] == Dictionary<Int, Double>
    func getPossibleTips() -> [Int: (tip:Double,total: Double)] {
        let possibleTips:[Double] = [0.15, 0.18, 0.20]
        var retval = Dictionary<Int, (tip:Double, total:Double)>()

        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTip(possibleTip)

        }
        return retval
    }
    
}
