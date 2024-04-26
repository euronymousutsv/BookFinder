//
//  profileUpdateVC.swift
//  BookFinder
//
//  Created by Utsav on 26/4/2024.
//

import UIKit

class profileUpdateVC: UIViewController {
    var user : User!
    
    var service = UserRepository()
    
    @IBOutlet weak var firstNameEdit: UITextField!
    
    
    @IBOutlet weak var lastNameEdit: UITextField!
    
    @IBOutlet weak var AddressEdit: UITextField!
    
    @IBAction func UpdateBTN(_ sender: Any) {
        
        let firstName = firstNameEdit.text!
        let lastName = lastNameEdit.text!
        let address = AddressEdit.text!
        let id = user.UID
        
        let userupdate = User(FirstName: firstName, LastName: lastName, Address: address, UID: id!)
        if service.updateUser(user: userupdate) {
            showAlertMessage(title: "Success", message: "Data updated Successfully")
        }else{
            showAlertMessage(title: "Failed", message: "Data couldn't be updated")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameEdit.text = "\(user.FirstName)"
        lastNameEdit.text = "\(user.LastName)"
        AddressEdit.text = "\(user.Address)"
        // Do any additional setup after loading the view.
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
