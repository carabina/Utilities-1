//
//  Extensions.swift
//
//  Created by Luciano Polit on 3/4/18.
//

import Foundation
import UIKit

extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

extension Collection {
    
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

extension Array {
    
    public mutating func prepend(_ element: Element) {
        insert(element, at: 0)
    }
    
    public mutating func prepend(contentsOf array: [Element]) {
        insert(contentsOf: array, at: 0)
    }
    
}

extension Array where Element: Equatable {
    
    public mutating func remove(_ element: Element) {
        while let index = index(of: element) {
            remove(at: index)
        }
    }
    
    public mutating func removeFirst(_ element: Element) {
        if let index = index(of: element) {
            remove(at: index)
        }
    }
    
}

extension UIColor {
    
    public convenience init(hex: String) {
        let str = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: str)
        
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
