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
    }
    
    func setDigit(_ digit: Digit) {
         inputValue.append(digit.description)
        calculate()
        print(inputValue)
    }
    
    func setDecimal(){
        inputValue.append(ButtonType.decimal.description)
    }
    
    func clear(){
        inputValue = ""
    }
    
    func calculate(){
        switch(origineel){
        case .vanEuro:
            guard let decimalAmount1 = Decimal(string: inputValue) else { return }
            let omgezet = decimalAmount1 * omzetting
            outputValue = omgezet.formatted()
           // outputValue = omgezet.description
        
        case .vanBEF:
            guard let decimalAmount1 = Decimal(string: inputValue) else { return }
            let omgezet = decimalAmount1 * omzetting
            outputValue = omgezet.formatted()
          //  outputValue = round(omgezet, 2).description
        
        }
    }
}
