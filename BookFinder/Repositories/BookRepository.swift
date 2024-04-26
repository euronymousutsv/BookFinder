//
//  BookRepository.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import Foundation
import FirebaseFirestore

public class BookRepository{
    
    var db=Firestore.firestore()
    
    func findBookById(id:String, onCompletion : @escaping (Book?)->Void){
        var BookResult: Book!
        let docRef = db.collection("Book").document(id)
        docRef.getDocument{(document, error) in
            if let doc = document, doc.exists{
                let data = doc.data()
                //calling constructor from Book class with dictonary on it
                BookResult = Book(BookId: doc.documentID, dictionary: data!)
                onCompletion(BookResult)
            }else{
                print("Document for the id: \(id) does not exist")
            }
            
        }
        
    }
    
    func addComment(userEmail: String, Comment: String, bookID: String) -> Bool {
        var result = true
        let dictionary : [String : Any] = [
            "userEmail": userEmail,
            "Comment":Comment
        ]
        db.collection("Book/\(bookID)/Feedback").addDocument(data: dictionary){error in
            if let error = error{
                print("Comment Could not be added: \(Comment), error: \(error)")
                result = false
            }else{
                print("Comment Added: \(Comment)")
            }
        }
        
        return result
    }
    
}
