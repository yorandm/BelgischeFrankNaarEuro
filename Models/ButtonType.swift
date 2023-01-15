//
//  ButtonType.swift
//  BelgischeFrankNaarEuro
//
//  Created by Yoran Demunter on 15/01/2023.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    //case operation(_ operation: ArithmeticOperation)
    case valuta(_ valuta: Valuta)
    case decimal
    case nothing
    var description: String {
            switch self {
            case .digit(let digit):
                return digit.description
            case .valuta(let valuta):
                return valuta.description
            case .decimal:
                return "."
            case .nothing:
                return ""
            }
        }
    
    var backgroundColor: Color {
        switch self {
        case .valuta:
            return .orange
        case  .decimal, .digit:
            return .secondary
        case .nothing:
            return .black
        }
    }
    
    var foregroundColor: Color {
        switch self {
        default:
            return .white
        }
    }
}
