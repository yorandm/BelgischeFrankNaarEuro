//
//  Valuta.swift
//  BelgischeFrankNaarEuro
//
//  Created by Yoran Demunter on 15/01/2023.
//

import Foundation
import SwiftUI

enum Valuta: Hashable, CustomStringConvertible {
    case vanBEF
    case vanEuro
    var description: String {
            switch self {
            case .vanBEF:
                return "BEF"
            case .vanEuro:
                return "€"
            }
        }
}

