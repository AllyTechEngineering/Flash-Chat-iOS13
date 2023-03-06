//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
// Added cocoapods

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "⚡️FlashChat"
        
//        var charIndex = 0.0
//        titleLabel.text = ""
//        let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//          charIndex += 1
//        }
    } //viewDidLoad
    

} //WelcomeViewController
