//
//  RegController.swift
//  BookFinder
//
//  Created by Utsav on 6/4/2024.
//

import UIKit
import Firebase

class RegController: UIViewController {

    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func RegisterBtn(_ sender: UIButton) {
        
        if let email = EmailTxtField.text,let password = PasswordTxtField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print (e)
                }
                else{
                    self.performSegue(withIdentifier: "RegtoMain", sender: self)
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
