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
                    print(e.localizedDescription)
                    let alert = UIAlertController(title: K.passwordIssue, message: e.localizedDescription, preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: K.defaultAction), style: .default, handler: { _ in
                          NSLog("The \"OK\" alert occured.")
                          } ) )
                          self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                } //else
            } //Auth.auth()
        } //if let email
    } // @IBAction func registerPressed
    
    
} //class RegisterViewController: UIViewController
