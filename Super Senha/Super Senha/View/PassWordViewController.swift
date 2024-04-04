//
//  ViewController.swift
//  Super Senha
//
//  Created by Mac on 19/11/2021.
//  Copyright © 2021 br.com.arthursilva. All rights reserved.
//

import UIKit

class PassWordViewController: UIViewController {
    
    @IBOutlet weak var tvPassword: UITextView!
    
    var passwordType: PasswordType = PasswordType()
    var passwordGenerator: PassWordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de Senhas: \(passwordType.numberOfPassword)"
        passwordGenerator = PassWordGenerator(passwordType: passwordType)
        
        generatePassword()
    }
    
    func generatePassword() {
        tvPassword.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPassword.text = " "
        let passwords = passwordGenerator.generate(total: passwordType.numberOfPassword)
        for password in passwords {
            tvPassword.text.append(password + "\n\n")
        }
    }
    
    @IBAction func Generate(_ sender: UIButton) {
        generatePassword()
    }
}
