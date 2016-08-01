//
//  TipCalc.swift
//  TipCalc2
//
//  Created by Chamikara Dharmasena on 7/31/16.
//  Copyright © 2016 Chamikara Dharmasena. All rights reserved.
//

import Foundation

class TipCalc {
    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    private var _splitAmount = 0.0
    private var _numberOfPeople = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var numberOfPeople: Int {
        return _numberOfPeople
    }
    
    var splitAmount: Double {
        return _splitAmount
    }
    
    init(billAmount: Double, tipPercent: Double){
        
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        
    }
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = tipAmount + billAmount
    }
    
    func split() {
        _splitAmount = _billAmount / Double(_numberOfPeople)
    }
}
