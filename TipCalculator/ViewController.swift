//
//  ViewController.swift
//  NoteShare
//
//  Created by Jakob Rydén on 15/08/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//
//
// NOTE: building the tutorial again for practice
// -then implement the core data storage for some text field
// -then add some network sync, done(!)

import UIKit

class ViewController: UIViewController, UITableViewDataSource { // should the viewController also be the data source??
    
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxSlider: UISlider!
    @IBOutlet var taxLabel: UILabel!
    //    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet weak var tableView: UITableView! // why weak?
    
    
    // Model connection
    let tipCalc = TipCalculatorModel(total: 100, percent: 0.1)
    var possibleTips = Dictionary<Int, (tip:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        refreshUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI()
    {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxSlider.value = Float(tipCalc.percent)*100
        taxLabel.text = "Tax: \(Int(taxSlider.value))%"
        //resultsTextView.text = "" // update already here?
        updateOutput() // couldn't i call an IBAction-function from my own code with a null-object passed? a little hacky perhaps
        
    }
    
    func updateOutput()
    {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        self.possibleTips = tipCalc.getPossibleTips()
        
        // text output
        //        var results = ""
        //        for (percent, toTip) in possibleTips
        //        {
        //            results += "\(percent)% -> \(toTip)\n"
        //        }
        sortedKeys = sorted(Array(possibleTips.keys))
        tableView.reloadData()
        
    }
    
    //TableViewDataSource:
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        let tipPercent = sortedKeys[indexPath.row]
        
        // nicer if keeping them named...
        let tipAmount = possibleTips[tipPercent]!.0
        let total = possibleTips[tipPercent]!.1
        
        cell.textLabel.text = "\(tipPercent)%:"
        cell.detailTextLabel.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmount, total)
        return cell
        
    }
    
    // UI Actions
    @IBAction func onTapCalculate(sender: AnyObject)
    {
        updateOutput()
    }
    @IBAction func taxPercentageChanged(sender: AnyObject)
    {
        tipCalc.percent = Double(taxSlider.value) / 100.0
        refreshUI()
        
    }
    @IBAction func onTapView(sender: AnyObject)
    {
        //        println ("Dismissing keyboard!")wsa
        totalTextField.resignFirstResponder() // dismisses keyboard when tapping 'outside'
    }
    
}

