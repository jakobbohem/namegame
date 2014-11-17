//
//  ToolViewController.swift
//  TipCalculator
//
//  Created by Jakob Rydén on 19/08/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//

//import Foundation
import UIKit

class ToolViewController: UIViewController { // should the viewController also be the data source??

    @IBOutlet var textView: UITextView!
    // 'view' implicitly defined here?

    // Model connection
    let tipCalc = TipCalculatorModel(total: 100, percent: 0.1)
    var possibleTips = Dictionary<Int, (tip:Double, total:Double)>()
    var sortedKeys:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshUI() {
        self.textView.text = "Defualt text!"

    }
}