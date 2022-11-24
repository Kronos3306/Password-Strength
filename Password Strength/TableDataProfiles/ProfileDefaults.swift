//
//  ProfileDefaults.swift
//  Password Strength
//
//  Created by Gleb Bair on 11/23/22.
//

import Foundation

class ProfileDefaults {
    
    public func generatePasswordSet() -> String {
        let comp = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*="
        
        return String((0..<12).map{ _ in comp.randomElement()! })
    }
}
