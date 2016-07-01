//
//  SignIViewController.swift
//  The Business Game
//
//  Created by Gonzalo Caballero on 6/30/16.
//  Copyright © 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var country: UIPickerView!
    
    var ref = FIRDatabase.database().reference()
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.country.delegate = self
        self.country.dataSource = self
        
        let tap: UITapGestureRecognizer?
        tap = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        view.addGestureRecognizer(tap!)
    }
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func signUpButton(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(mail.text!, password: password.text!, completion: {
            user, error in
            if error != nil {
                print("errr")
            }
            else {
                
                
                var userInfo: [String: String] =
                    ["Name": "",
                    "Country": "",
                    "Mail": ""]

                userInfo["Name"] = self.name.text!
                userInfo["Mail"] = self.mail.text!
                userInfo["Country"] = self.countryNames[self.country.selectedRowInComponent(0)]
                let registerUser = self.ref.child("Users")
                
                registerUser.child((user?.uid)!).setValue(userInfo)
                register = false
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    let countryNames = ["US", "Chile", "Other"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryNames[row]
    }
    

    

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


