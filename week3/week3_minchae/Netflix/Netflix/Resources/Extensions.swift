//
//  Extensions.swift
//  Netflix
//
//  Created by 황민채 on 5/12/24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
