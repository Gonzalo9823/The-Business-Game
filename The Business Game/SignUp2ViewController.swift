//
//  SignUp2ViewController.swift
//  The Business Game
//
//  Created by Gonzalo Caballero on 7/12/16.
//  Copyright © 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUp2ViewController: UIViewController {
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var companyName: UITextField!
    
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gamesOption(sender: AnyObject) {
        if companyName.text != "" {
            FIRAuth.auth()?.createUserWithEmail(mailOfPlayer, password: passwordOfPlayer, completion: {
                user, error in
                if error != nil {
                    print("ERROR!")
                }
                else {
                    self.activityIndicatorView.startAnimating()
                    var userInfo: [String: String] =
                        [   "Name": "",
                            "Country": "",
                            "Mail": "",
                            "Company Name": ""
                    ]
                    
                    userInfo["Name"] = nameOfPlayer
                    userInfo["Mail"] = mailOfPlayer
                    userInfo["Country"] = countryOfPlayer
                    userInfo["Company Name"] = self.companyName.text!
                    
                    let registerUser = self.ref.child("Users")
                    registerUser.child("Games").child(self.companyName.text!).setValue(userInfo)
                    self.dismissViewControllerAnimated(true, completion: {})
                    print("WORK")
                    
                    
                }
            })
        }
    }
    
    @IBAction func clothDesigner(sender: AnyObject) {
        if companyName.text != "" {
            FIRAuth.auth()?.createUserWithEmail(mailOfPlayer, password: passwordOfPlayer, completion: {
                user, error in
                if error != nil {
                    print("ERROR!")
                }
                else {
                    self.activityIndicatorView.startAnimating()
                    var userInfo: [String: String] =
                        [   "Name": "",
                            "Country": "",
                            "Mail": "",
                            "Company Name": ""
                    ]
                    
                    userInfo["Name"] = nameOfPlayer
                    userInfo["Mail"] = mailOfPlayer
                    userInfo["Country"] = countryOfPlayer
                    userInfo["Company Name"] = self.companyName.text!
                    
                    let registerUser = self.ref.child("Users")
                    registerUser.child("Cloth Designer").child(self.companyName.text!).setValue(userInfo)
                    self.dismissViewControllerAnimated(true, completion: {})
                    print("WORK")
                    
                    
                }
            })
        }
    }
}
