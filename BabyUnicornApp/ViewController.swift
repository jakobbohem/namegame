//
//  ViewController.swift
//  NetlightNameGame
//
//  Created by Thor Bossuyt on 2014-11-16.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datasource = BabyUnicornDataSource()

    
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBAction func Button1Action(sender: AnyObject) {
        var button = sender as (UIButton)
        checkResult(button.currentTitle!)
    }
    @IBAction func Button4Action(sender: AnyObject) {
        var button = sender as (UIButton)
        checkResult(button.currentTitle!)
    }
    @IBAction func Button3Action(sender: AnyObject) {
        var button = sender as (UIButton)
        checkResult(button.currentTitle!)
    }
    @IBAction func Button2Action(sender: AnyObject) {
        var button = sender as (UIButton)
        checkResult(button.currentTitle!)
    }
    

    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    var correctUnicorn : BabyUnicorn!
    var totalTries : Int = 0
    var totalCorrect : Int = 0
    
    func checkResult(buttonText : String?){
        print(buttonText)
        print("\(correctUnicorn.firstName) \(correctUnicorn.lastName)")
        if(buttonText == "\(correctUnicorn.firstName) \(correctUnicorn.lastName)"){
            totalCorrect = totalCorrect + 1
            totalTries = totalTries + 1
            ResultLabel.text = "Correct! \(totalCorrect) / \(totalTries)"
        }
        else{
            totalTries = totalTries + 1
            ResultLabel.text = "Wrong! \(totalCorrect) / \(totalTries)"
        }

        viewDidLoad()
    }

 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fourRandomPeeps: [BabyUnicorn] = []
        var shuffledUnicorns = shuffle(datasource.babyUnicorns)
        var correctUnicornNumber = Int(arc4random_uniform(4))

        
        fourRandomPeeps.append(shuffledUnicorns[0])
        fourRandomPeeps.append(shuffledUnicorns[1])
        fourRandomPeeps.append(shuffledUnicorns[2])
        fourRandomPeeps.append(shuffledUnicorns[3])

        correctUnicorn = fourRandomPeeps[correctUnicornNumber]
        ImageView.image = correctUnicorn.image


        Button1.setTitle("\(fourRandomPeeps[0].firstName) \(fourRandomPeeps[0].lastName)", forState: UIControlState.Normal)
        Button2.setTitle("\(fourRandomPeeps[1].firstName) \(fourRandomPeeps[1].lastName)", forState: UIControlState.Normal)
        Button3.setTitle("\(fourRandomPeeps[2].firstName) \(fourRandomPeeps[2].lastName)", forState: UIControlState.Normal)
        Button4.setTitle("\(fourRandomPeeps[3].firstName) \(fourRandomPeeps[3].lastName)", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        let count = countElements(list)
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
    
}

