//
//  UserRepository.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import Foundation
import FirebaseFirestore
import Firebase

public class UserRepository{
    var db=Firestore.firestore()
    var users = [User]()
    let userID = Auth.auth().currentUser?.uid
    func addUser(user: User) -> Bool{
        var result = true
        
        let dictionary : [String: Any] = [
            "Address": user.Address,
            "FirstName":user.FirstName,
            "LastName":user.LastName
            
            
        ]
        db.collection("User").document(user.UID!).setData(dictionary){
            error in
            if let error = error {
                print ("User couldnot be added, error: \(error)")
                result = false
            }
            else{
                print("User Added")
            }
        }
        return result
    }
    
    func updateUser(user: User)->Bool{
    var result = true
        let dictionary: [String:Any] = [
            "FirstName": user.FirstName,
            "LastName": user.LastName,
            "Address":user.Address
        ]
        
        db.collection("User").document(userID!).updateData(dictionary){error in
            if let error=error{
                print("Error updating Document: \(error)")
                result=false
            }else{
                print("Document updated")
            }
            
        }
        return result
}
}
