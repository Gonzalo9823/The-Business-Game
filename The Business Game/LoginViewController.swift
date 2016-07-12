//
//  ViewController.swift
//  LoginScreen
//
//  Created by Gonzalo Caballero on 6/30/16.
//  Copyright © 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer?
        tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logIn(sender: AnyObject) {
        activityIndicator.startAnimating()
        FIRAuth.auth()?.signInWithEmail(userName.text!, password: passWord.text!, completion: {
            user, error in
            if error != nil {
                self.activityIndicator.stopAnimating()
            }
            else {
                print("haz iniciado secion")
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}

