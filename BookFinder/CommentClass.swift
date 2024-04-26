//
//  CommentClass.swift
//  BookFinder
//
//  Created by Utsav on 26/4/2024.
//


import Foundation
public class Comment{
    var CommentId: String?
    var userEmail: String
    var Comment: String
    
    
    //constructor for creating book
    init(userEmail: String, Comment: String) {
        
        self.userEmail = userEmail
        self.Comment = Comment
        
    }
    convenience init(CommentId: String, userEmail: String, Comment: String) {
        self.init(userEmail: userEmail, Comment: Comment)
        self.CommentId = CommentId
        
    }
    
    convenience init(CommentId: String, dictionary: [String: Any]){
        self.init(  CommentId: CommentId,
                    userEmail: dictionary["userEmail"] as! String,
                    Comment: dictionary["Comment"] as! String
                    
        )}
}
