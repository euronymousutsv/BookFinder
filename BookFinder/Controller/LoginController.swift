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
        if let email = email.text, let password = password.text{
            Auth.auth().signIn(withEmail: email, password: password){ authResult ,error in
                if let e = error, let authRe=authResult{
                    print(e)
                }
                else{
                    self.performSegue(withIdentifier: "LogintoMain", sender: self)
                }
                
            }
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

}
