//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {

        //optional chaining and combining 
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                } //else
            } //Auth.auth()
        } //if let email
    } // @IBAction func registerPressed
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "RegisterToChat" {
//            let destinationCVC = segue.destination as! ChatViewController
//        } //if segue
//    } // override func prepare
    
} //class RegisterViewController: UIViewController
