//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginToChat", sender: self)
    } //  @IBAction func loginPressed
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToChat" {
            //let destinationVC = segue.destination as! ChatViewController
        } //if segue
    } // override func prepare
} //class LoginViewController: UIViewController
