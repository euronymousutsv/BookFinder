//
//  ProfileController.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import UIKit
import Firebase
import FirebaseFirestore
class ProfileController: UIViewController {
    let database = Firestore.firestore()
    var user = [User]()
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
