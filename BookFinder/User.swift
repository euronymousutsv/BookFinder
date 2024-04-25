//
//  User.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import Foundation
public class User{
    var FirstName:String
    var LastName:String
    var Address:String
    var UID:String?
    
    init(FirstName: String, LastName: String, Address: String) {
        self.FirstName = FirstName
        self.LastName = LastName
        self.Address = Address
        
    }
 
    convenience init(FirstName: String, LastName: String, Address:String,UID:String){
        self.init(FirstName: FirstName, LastName: LastName, Address: Address)
        self.UID = UID
    }
    
    convenience init (UID:String, dictionary:[String:Any]){
        self.init(FirstName: dictionary["FirstName"] as! String,
                  LastName: dictionary["LastName"]as! String,
                  Address: dictionary["Address"]as! String,
                  UID: UID)
    }
    
    func toString()-> String{
        return "UID: \(self.UID ?? ""), FirstName: \(self.FirstName)"
        
    }
    


    }

