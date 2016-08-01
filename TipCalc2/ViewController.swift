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
    
    @IBOutlet weak var noOfPeopleSlider: UISlider!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    
    //Mark: - Properties
    var tipsyCal = TipCalc(billAmount: 0.0, tipPercent: 0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentValue()
        
        tipsyTitleVie.layer.shadowColor = UIColor.blackColor().CGColor
        tipsyTitleVie.layer.shadowOpacity = 1
        tipsyTitleVie.layer.shadowOffset = CGSizeZero
        tipsyTitleVie.layer.shadowRadius = 10
        
        billAmountTextField.layer.cornerRadius = 5.0
       
    }
    
    //Mark: - @IBActions

    @IBAction func billAmountChanged(sender: AnyObject) {
        calcTip()
        
    }
    @IBAction func tipPercentChanged(sender: AnyObject) {
        tipPercentValue()
        calcTip()
    }
    
    @IBAction func noOfPeopleChange(sender: AnyObject) {
        splitValue()
        calcEachAmount()
        updateUI()
    }
    //Mark: - functions
    
    func calcTip() {
        tipsyCal.tipPercent = Double(tipPercentSlider.value)
        tipsyCal.billAmount = ((billAmountTextField.text)! as NSString).doubleValue
        tipsyCal.calculateTip()
        updateUI()
    }
    
    func calcEachAmount() {
        tipsyCal.numberOfPeople = Int(noOfPeopleSlider.value)
        //tipsyCal.billAmount = ((billAmountTextField.text)! as NSString).doubleValue
        tipsyCal.calculateTip()
       tipsyCal.split()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipsyCal.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f",tipsyCal.totalAmount)
        splitAmount.text = String(format:  "$%0.2f", tipsyCal.splitAmount)
    }
    
    func tipPercentValue() {
        tipPresentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
    func splitValue() {
        splitLbl.text = "SPLIT: \(Int(noOfPeopleSlider.value))"
    }
 

}

