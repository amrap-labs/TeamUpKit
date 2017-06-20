//
//  ViewController.swift
//  TeamupKit-Example
//
//  Created by Merrick Sapsford on 10/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import TeamupKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = Bundle(for: type(of: self)).path(forResource: "Credentials", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: plist) as! [String : Any]
        
        let teamup = Teamup(apiToken: dictionary["apiToken"] as! String,
                            businessId: dictionary["businessId"] as! String)
        
        if !teamup.auth.isAuthenticated {
            teamup.auth.logIn(with: dictionary["email"] as! String,
                              password: dictionary["password"] as! String,
                              success: { (user) in
                                print("logged in!")
            },
                              failure: nil)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

