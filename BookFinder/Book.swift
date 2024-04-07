//
//  Book.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import Foundation
public class Book{
    var BookId: String?
    var Name: String
    var Author: String
    var ISBN:String
    var Image: String
    var Genre:String
    
    //constructor for creating book
    init(Name: String, Author: String, ISBN: String, Image: String, Genre: String) {
        
        self.Name = Name
        self.Author = Author
        self.ISBN = ISBN
        self.Image = Image
        self.Genre = Genre
    }
    
    
    //constructor for finding book by id
    convenience init(BookId:String,Name: String, Author: String, ISBN: String, Image: String, Genre: String) {
        self.init(Name: Name, Author: Author, ISBN: ISBN, Image: Image, Genre: Genre)
        self.BookId=BookId
    }
    //to handle firebase dictionary
    convenience init(BookId: String, dictionary: [String: Any]){
        self.init(  BookId: BookId,
                    Name: dictionary["Name"] as! String,
                    Author: dictionary["Author"] as! String,
                    ISBN:  dictionary["ISBN"] as! String,
                    Image: dictionary["Photo"] as! String,
                    Genre: dictionary["Genre"] as! String
        )}
    
        func toString()->String{
            return "id: \(self.BookId ?? "" ), name: \(self.Name), Author: \(self.Author), Image: \(self.Image), Genre: \(self.Genre), ISBN: \(self.ISBN)"
        }
        
    }

