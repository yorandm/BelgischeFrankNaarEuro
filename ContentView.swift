//
//  ContentView.swift
//  BelgischeFrankNaarEuro
//
//  Created by Yoran Demunter on 15/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var stringAmount1 = ""
    @State private var stringAmount2 = ""
    @State private var resultString: String = ""
    @ObservedObject private var calculator = Calculator()
//    private var omzetting: Decimal = 40.3399
    
    var buttonTypes: [[ButtonType]] {
        [
            [.valuta(.vanBEF), .nothing, .valuta(.vanEuro)],
         [.digit(.seven), .digit(.eight), .digit(.nine)],
         [.digit(.four), .digit(.five), .digit(.six)],
         [.digit(.one), .digit(.two), .digit(.three)],
            [.digit(.zero), .decimal, .nothing]
        
        ]
    }
    
    private func getButtonSize() -> CGFloat {
         let screenWidth = UIScreen.main.bounds.width
         let buttonCount: CGFloat = 4
         let spacingCount = buttonCount + 1
         return (screenWidth - (spacingCount * 12)) / buttonCount
     }
    var body: some View {
        
            VStack {
                Spacer()
                HStack{
                    Text(calculator.inputValue)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 88, weight: .light))
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                    Text(calculator.origineel.description)
                       
                } .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 88, weight: .light))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                
                HStack{
                    Text(calculator.outputValue)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.system(size: 88, weight: .light))
                        .lineLimit(1)
                        .minimumScaleFactor(0.2)
                    Text(calculator.naar.description)
                       
                } .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.system(size: 88, weight: .light))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
                
                VStack (alignment:.leading){
                    ForEach(buttonTypes, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { buttonType in
                                Button(buttonType.description) {
                                    switch buttonType {
                                    case .digit(let digit):
                                        calculator.setDigit(digit)
                                    case .valuta(let valuta):
                                        calculator.setOriginel(valuta)
                                    case .decimal:
                                        calculator.setDecimal()
                                    case .nothing:
                                        calculator.clear()
                                    }
                                }.font(.system(size: 32, weight: .medium))
                                    .frame(maxWidth: .infinity,
                                           maxHeight: getButtonSize(),alignment: .center)
                                    .background(buttonType.backgroundColor)
                                    .foregroundColor(buttonType.foregroundColor)
                                    .cornerRadius(30)
                                
                                    
                            }
                        }
                    }
                }
            }
            .background(Color.black)
        }
        

//    func euroToFrank() {
//        guard let decimalAmount1 = Decimal(string: stringAmount1) else { return }
//        let omgezet = decimalAmount1 * omzetting
//        resultString = omgezet.description + " BEF"
//    }
//
//    func frankToEuro() {
//        guard let decimalAmount1 = Decimal(string: stringAmount1) else { return }
//        let omgezet = decimalAmount1 / omzetting
//        resultString = omgezet.description + " €"
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPad (9th generation)").previewDevice("iPad")
    }
}
