//
//  BookDetailsTVController.swift
//  BookFinder
//
//  Created by Utsav on 26/4/2024.
//

import UIKit
import Firebase

class BookDetailsTVController: UITableViewController {
    
    var books : Book!
    var service = BookRepository()
    
    @IBOutlet weak var BookImage: UIImageView!
    
    @IBOutlet weak var BookName: UILabel!
    
    
    @IBOutlet weak var Author: UILabel!
    
    @IBOutlet weak var Genrelbl: UILabel!
    
    @IBOutlet weak var ISBNlbl: UILabel!
    
    @IBAction func postCmnt(_ sender: Any) {
        var comment = CommentTxt.text
        var bookId = books.BookId
        
        var userEmail = Auth.auth().currentUser?.email
        
        if service.addComment(userEmail: userEmail!, Comment: comment!, bookID: bookId!){
            showAlertMessage(title: "Comment Successfull", message: "Thank you for your feedback")
            
        }else{
            showAlertMessage(title: "Comment Unsuceeful", message: "Your Feedback couldnot be added")
        }
        
    }
    
    @IBOutlet weak var CommentTxt: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookName.text = ("\(books.Name)")
        Author.text = ("\(books.Author)")
        Genrelbl.text = ("\(books.Genre)")
        ISBNlbl.text = ("\(books.ISBN)")
        
        if let url = URL(string: books.Image), !books.Image.isEmpty {
                BookImage.loadImage(from: url)
            }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
