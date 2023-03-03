//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterToChat", sender: self)
    } // @IBAction func registerPressed
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RegisterToChat" {
            let destinationCVC = segue.destination as! ChatViewController
        } //if segue
    } // override func prepare
} //class RegisterViewController: UIViewController
