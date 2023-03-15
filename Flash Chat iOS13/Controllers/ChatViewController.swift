//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Refactored by Bob Taylor March 2023
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        //    Message(sender: "bob.taylor.mba@gmail.com", body: "Hey!"),
        //    Message(sender: "btaylor@taylordrone.com", body: "Drone"),
        //    Message(sender: "btaylor@taylorsailing.com", body: "Sailing")
    ] // var messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
        
    } // override func viewDidLoad
    
    func loadMessages() {
        // clear messages array
        messages = []
        // call database
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error ) in
                // clear messages array
                self.messages = []
                if let e = error {
                    print("There was an issue with retrieveing data from Firestore\(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                } //Dispatch
                            } //if let
                        } //for doc in
                    } //if let
                } //else
            } //db
    } //did load
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data:
                                                                [K.FStore.senderField : messageSender,
                                                                 K.FStore.bodyField: messageBody,
                                                                 K.FStore.dateField: Date().timeIntervalSince1970])
            { (error) in
                if let e = error {
                    print("There was an error \(e)")
                } else {
                    print("Successfully saved data to Firestore")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = nil
                    } //DispatchQueue
                } //else
            } //error
        } //if let messageBody
        
        self.dismiss(animated: true, completion: nil)
    } //@IBAction func sendPressed
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print(K.errorSignOut, signOutError)
        } //catch let
    } // @IBAction func logOutPressed
} //class ChatViewController: UIViewController

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    } //extension ChatViewController:
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        // This is a message from the current user
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
            
        } //else
        return cell
    } //func tableView
    
} //extension ChatViewController:
