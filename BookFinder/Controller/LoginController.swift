//
//  LoginController.swift
//  BookFinder
//
//  Created by Utsav on 6/4/2024.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func Register(_ sender: Any) {
        let email = email.text
        if email!.isEmpty{
         showAlertMessage(title: "Email is mandatory", message: "We need the User Email")
            return
        }
        
        let password = password.text
        if password!.isEmpty{
            showAlertMessage(title: "password is mandatory", message: "We need the user password")
            return
        }
       
       
            Auth.auth().signIn(withEmail: email!, password: password!){ authResult ,error in
                if let e = error, let authRe=authResult{
                    print(e)
                }
                else{
                    print(Auth.auth().currentUser?.email)
                    let ViewController = self.storyboard?.instantiateViewController(identifier: "Main") as? UINavigationController
                    self.view.window?.rootViewController = ViewController
                    self.view.window?.makeKeyAndVisible()
                }
                
            }
        }
        
    
    func showAlertMessage(title : String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


