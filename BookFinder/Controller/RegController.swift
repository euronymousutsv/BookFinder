//
//  RegController.swift
//  BookFinder
//
//  Created by Utsav on 6/4/2024.
//

import UIKit
import Firebase

class RegController: UIViewController {
    var user=[User]()
    let service = UserRepository()
    
    
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func RegisterBtn(_ sender: UIButton) {
        let email = EmailTxtField.text
        if email!.isEmpty{
         showAlertMessage(title: "Email is mandatory", message: "We need the User Email")
            return
        }
        
        let password = PasswordTxtField.text
        if password!.isEmpty{
            showAlertMessage(title: "password is mandatory", message: "We need the user password")
            return
        }
        let firstName = FirstName.text
        if firstName!.isEmpty{
            showAlertMessage(title: "first name is mandatory", message: "We need the user name")
            return
        }
        let lastName = LastName.text
        if lastName!.isEmpty{
            showAlertMessage(title: "last Name is mandatory", message: "We need the user name")
            return
        }
        let address = Address.text
        if address!.isEmpty{
            showAlertMessage(title: "address is mandatory", message: "We need the user address")
            return
        }
        
        
        
        
        if let email = EmailTxtField.text , let password = PasswordTxtField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print (e)
                }
                else{
                    if let userID = authResult?.user.uid{
                        print("User ID:\(userID)")
                        
                        let user = User(FirstName: firstName!, LastName: lastName!, Address: address!, UID: userID)
                        
                        
                        if self.service.addUser(user: user){
                            self.showAlertMessage(title: "Successfully Registered", message: "User Added")
                        }else{
                            self.showAlertMessage(title: "Failed to Register", message: "User not Registered")
                        }
                    //    let users = User(FirstName: FirstName.text, LastName: LastName.text, Address: Address.text, UID: userID)
                    }
                    
//                    self.performSegue(withIdentifier: "RegtoMain", sender: self)
                    
                    let ViewController = self.storyboard?.instantiateViewController(identifier: "Main") as? UINavigationController
                    self.view.window?.rootViewController = ViewController
                    self.view.window?.makeKeyAndVisible()
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
    func showAlertMessage(title : String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}
