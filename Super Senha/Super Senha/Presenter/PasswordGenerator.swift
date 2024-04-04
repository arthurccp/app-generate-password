//
//  PasswordGenerator.swift
//  Super Senha
//
//  Created by Mac on 19/11/2021.
//  Copyright © 2021 br.com.arthursilva. All rights reserved.
//

import Foundation

class PassWordGenerator {
    
    var passwordType: PasswordType
    var passwords: [String] = []
    
    private let letter = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_+=˜`|]}[{':;?/<>.,"
    private let number = "0123456789"
    
    init(passwordType: PasswordType) {
        self.passwordType = passwordType
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if passwordType.userletters {
            universe += letter
        }
        if passwordType.userNumbers {
            universe += number
        }
        if passwordType.userSpecialCharacters {
            universe += specialCharacters
        }
        if passwordType.userCapitalLetters {
            universe += letter.uppercased()
        }
        
        let universeArray = Array(universe)
        let numberOfCharacters = max(min(passwordType.numberOfCharacters, 16), 1)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
