//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Bobby Taylor on 3/8/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
// Constants file

import Foundation
struct K {
    static let errorSignOut = "Error signing out: %@"
    static let defaultAction = "Default action"
    static let passwordIssue = "Password Issue"
    static let errorLabel = "Error"
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    } //BrandColors
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    } //FSStore
} //Constants
