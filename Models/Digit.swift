//
//  Digit.swift
//  BelgischeFrankNaarEuro
//
//  Created by Yoran Demunter on 15/01/2023.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
