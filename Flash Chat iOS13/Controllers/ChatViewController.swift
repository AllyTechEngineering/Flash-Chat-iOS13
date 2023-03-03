//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    } // override func viewDidLoad
    
    @IBAction func sendPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    } //@IBAction func sendPressed
    

} //class ChatViewController: UIViewController
