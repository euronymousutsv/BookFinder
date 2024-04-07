//
//  ViewController.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    let database = Firestore.firestore()
    var book=[Book]()
    let service = BookRepository()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBOutlet weak var Genre: UITextField!
    @IBOutlet weak var Image: UITextField!
    
    @IBOutlet weak var ISBN: UITextField!
    @IBOutlet weak var Id: UITextField!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Author: UITextField!
    
    @IBAction func FindbyIdBtn(_ sender: Any) {
        var myBook: Book!
        let docId = Id.text
        if docId!.isEmpty{
            showAlertMessage(title: "ID is mandatory", message: "We need the ID to find contact")
            return
        }
        
        service.findBookById(id: docId!){ retBook in
            if let retBook = retBook {
                myBook = retBook
                
                
                self.Id.text = myBook.BookId
                self.Name.text = myBook.Name
                self.Author.text = myBook.Author
                self.Image.text = myBook.Image
                self.Genre.text = myBook.Genre
                self.ISBN.text = myBook.ISBN

            }
            
        }
        
        
        
        
        
        
    }
    
    
    func showAlertMessage(title: String , message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert,animated: true)
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
