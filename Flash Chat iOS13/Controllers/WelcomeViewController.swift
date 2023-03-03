//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
// Added cocoapods

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var charIndex = 0.0
        titleLabel.text = ""
        let titleText = "⚡️FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
          charIndex += 1
        }
       
    } //viewDidLoad
    

} //WelcomeViewController
