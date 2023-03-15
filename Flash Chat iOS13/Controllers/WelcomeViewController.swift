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
    
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = K.appName
        
    } //viewDidLoad
    

} //WelcomeViewController
