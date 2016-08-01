//
//  ViewController.swift
//  TipCalc2
//
//  Created by Chamikara Dharmasena on 7/31/16.
//  Copyright © 2016 Chamikara Dharmasena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark: - @IBOutlets
    @IBOutlet weak var tipsyTitleVie: UIView!
    @IBOutlet weak var tipsyTitleLbl: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPresentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    //Mark: - Properties
    var tipsyCal = TipCalc(billAmount: 0.0, tipPercent: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentValue()
       
    }
    
    //Mark: - @IBActions

    @IBAction func billAmountChanged(sender: AnyObject) {
        calcTip()
        
    }
    @IBAction func tipPercentChanged(sender: AnyObject) {
        tipPercentValue()
        calcTip()
    }
    
    //Mark: - functions
    
    func calcTip() {
        tipsyCal.tipPercent = Double(tipPercentSlider.value)
        tipsyCal.billAmount = ((billAmountTextField.text)! as NSString).doubleValue
        tipsyCal.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipsyCal.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f",tipsyCal.totalAmount)
    }
    
    func tipPercentValue() {
        tipPresentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
 

}

