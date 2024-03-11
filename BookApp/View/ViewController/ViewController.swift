//
//  ViewController.swift
//  BookApp
//
//  Created by Ferhat Ayar on 7.03.2024.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil {
                    self.presentAlert(titleMessage: "Error", outMessage: error!.localizedDescription)
                }else{
                    guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
            
        }else{
            presentAlert(titleMessage: "Error", outMessage: "Email/Password?")
        }
        
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil{
                    self.presentAlert(titleMessage: "Error", outMessage: error!.localizedDescription)
                }else{
                    guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
            }
            
        }else {
            presentAlert(titleMessage: "Error", outMessage: "Email/Password?")
        }
        
    }
    
    func presentAlert(titleMessage:String, outMessage:String){
        let alert = UIAlertController(title: titleMessage, message: outMessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

