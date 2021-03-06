//
//  AuthenticationController.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 10/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

public extension Notification.Name {
    
    public static let TeamupAuthenticationDidLogIn = Notification.Name(rawValue: "TU_AuthStateDidLogIn")
    public static let TeamupAuthenticationDidRegister = Notification.Name(rawValue: "TU_AuthStateDidRegister")
    public static let TeamupAuthenticationDidSignOut = Notification.Name(rawValue: "TU_AuthStateDidSignOut")
}

public protocol AuthenticationController: class, Controller {
    
    /// The currently authenticated user.
    var currentUser: User? { get }
    
    /// Whether a user is currently authenticated.
    var isAuthenticated: Bool { get }
    
    /// Log In to an existing Teamup account.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - success: Execution block if the login succeeds.
    ///   - failure: Execution block if the login fails.
    func logIn(email: String,
               password: String,
               success: ((User) -> Void)?,
               failure: Controller.MethodFailure?)
    
    /// Register a new Teamup account.
    ///
    /// - Parameters:
    ///   - email: The user's desired email address.
    ///   - password: The user's desired password.
    ///   - firstName: The user's first name.
    ///   - surname: The user's surname.
    ///   - success: Execution block if the registration succeeds.
    ///   - failure: Execution block if the registration fails.
    func register(email: String,
                  password: String,
                  firstName: String,
                  surname: String,
                  success: ((User) -> Void)?,
                  failure: Controller.MethodFailure?)
    
    /// Sign out of the current user.
    func signOut()
}
