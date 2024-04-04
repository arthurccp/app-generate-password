//
//  ViewController.swift
//  Super Senha
//
//  Created by Mac on 19/11/2021.
//  Copyright © 2021 br.com.arthursilva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumbersOfCharacters: UITextField!
    @IBOutlet weak var swletters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialcharacters: UISwitch!
    
    var passwordType: PasswordType = PasswordType()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPasswordViewController" {
            let passwordViewController = segue.destination as! PassWordViewController
            if let numberOfpassword = Int(tfTotalPasswords.text!) {
                passwordType.numberOfPassword = numberOfpassword
            }
            if let numberOfCharacters = Int(tfNumbersOfCharacters.text!) {
                passwordType.numberOfCharacters = numberOfCharacters
            }
            passwordType.userletters = swletters.isOn
            passwordType.userNumbers = swNumbers.isOn
            passwordType.userCapitalLetters = swCapitalLetters.isOn
            passwordType.userSpecialCharacters = swSpecialcharacters.isOn
            
            passwordViewController.passwordType = passwordType 
        }
    }

}
