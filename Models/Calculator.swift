//
//  Calculator.swift
//  BelgischeFrankNaarEuro
//
//  Created by Yoran Demunter on 15/01/2023.
//

import Foundation
class Calculator:ObservableObject{
    @Published var origineel: Valuta = Valuta.vanEuro
    @Published var naar: Valuta = Valuta.vanBEF
    @Published var inputValue: String = ""
    @Published var outputValue: String = ""
    private var omzetting: Decimal = 40.3399

    
    func setOriginel(_ originel: Valuta){
        origineel = originel
        switch(originel){
        case .vanBEF:
            origineel = .vanBEF
            naar = .vanEuro
        case .vanEuro:
            origineel = .vanEuro
            naar = .vanBEF
        }
        calculate()
    }
    
    func setDigit(_ digit: Digit) {
         inputValue.append(digit.description)
        calculate()
    }
    
    func setDecimal(){
        inputValue.append(ButtonType.decimal.description)
    }
    
    func clear(){
        inputValue = ""
        outputValue = ""
    }
    
    func deleteChar(){
        if(inputValue.count > 0){
            inputValue.removeLast()
        }else{
            outputValue = ""
        }
        calculate()
    }
    
    func calculate(){
        switch(origineel){
        case .vanEuro:
            guard let decimalAmount1 = Decimal(string: inputValue) else { return }
            let omgezet = decimalAmount1 * omzetting
            let doublevalue:Double = Double(omgezet.description)!
            outputValue = String(format: "%.2f", doublevalue)
        
        case .vanBEF:
            guard let decimalAmount1 = Decimal(string: inputValue) else { return }
            let omgezet = decimalAmount1 / omzetting
            let doublevalue:Double = Double(omgezet.description)!
            outputValue = String(format: "%.2f", doublevalue)

        
        }
    }
    
}
