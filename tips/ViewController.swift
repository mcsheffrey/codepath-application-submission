//
//  ViewController.swift
//  tips
//
//  Created by Connor McSheffrey on 8/16/15.
//  Copyright (c) 2015 Connor McSheffrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel1: UILabel!
    
    @IBOutlet weak var totalLabel2: UILabel!
    
    @IBOutlet weak var totalLabel3: UILabel!
    
    @IBOutlet weak var totalLabel4: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        tipLabel.text = "$0.00"
        totalLabel1.text = "$0.00"
        
        // Focus on bill input field when app launches
        billField.becomeFirstResponder()
        
        tipControl.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        var numberOfDiners👨‍👩‍👧‍👦 = [totalLabel1,totalLabel2,totalLabel3,totalLabel4]
        
        // fade in tip % segnment control
        if (countElements(billField.text) > 0) {
            UIView.animateWithDuration(0.4,
                delay: 0,
                options: .CurveEaseInOut,
                animations: {
                    self.tipControl.alpha = 1
                    self.tipControl.center = CGPoint(x: 160, y: 175)
                },
                completion: { finished in
                    println("Animation done")
                }
            )
        // Return to hidden position
        } else {
            UIView.animateWithDuration(0.4,
                delay: 0,
                options: .CurveEaseInOut,
                animations: {
                    self.tipControl.alpha = 0
                    self.tipControl.center = CGPoint(x: 160, y: 200)
                },
                completion: { finished in
                    println("Animation done")
                }
            )
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        for index in 0...3 {
            println(index)
            var guestTip💸 = Float(total)/(Float(index) + 1)

            numberOfDiners👨‍👩‍👧‍👦[index].text = String(format: "$%.2f", guestTip💸)
            
        }
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

