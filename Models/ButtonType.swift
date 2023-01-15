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
    case clear
    case deleteChar
    var description: String {
            switch self {
            case .digit(let digit):
                return digit.description
            case .valuta(let valuta):
                return valuta.description
            case .decimal:
                return "."
            case .clear:
                return "C"
            case .deleteChar:
                return "DEL"
            }
        }
    
    var backgroundColor: Color {
        switch self {
        case .valuta:
            return .orange
        case  .decimal, .digit:
            return .secondary
        case .clear, .deleteChar:
            return Color(.lightGray)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        default:
            return .white
        }
    }
}
