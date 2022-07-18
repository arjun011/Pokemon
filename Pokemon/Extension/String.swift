//
//  String.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

extension String {
    
    /// Capitalize Frist letter of String
    /// - Returns: arjun -> Arjun
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
