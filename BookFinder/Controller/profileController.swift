//
//  profileController.swift
//  BookFinder
//
//  Created by Utsav on 26/4/2024.
//

import UIKit
import Firebase
import FirebaseDatabase
class profileController: UIViewController {


    @IBOutlet weak var FirstName: UILabel!
    
    @IBOutlet weak var LastName: UILabel!
    
    @IBOutlet weak var Address: UILabel!
    
    @IBAction func EditUser(_ sender: Any){
        self.performSegue(withIdentifier: "ProfiletoEdit", sender: self)
    }
    @IBAction func SignOutBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            let ViewController = storyboard?.instantiateViewController(identifier: "Entry") as? UINavigationController
            view.window?.rootViewController = ViewController
            view.window?.makeKeyAndVisible()
            
        }catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
            
        }
    

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}