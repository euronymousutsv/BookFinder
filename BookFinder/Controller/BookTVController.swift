//
//  BookTVController.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import UIKit

class BookTVController: UITableViewController {
    let service = BookRepository() //instace of book repository
    var Books=[Book]() //creation of array to store Book
    var selectedBook : Book!
    @IBOutlet var bookTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let docRef = service.db.collection("Book")
            .addSnapshotListener{querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.Books = documents.compactMap({queryDocumentSnapshot -> Book? in
                        let data = queryDocumentSnapshot.data()
                        return Book(BookId: queryDocumentSnapshot.documentID, dictionary: data)
                    })
                    
 //                   for book in self.Books {
  //                      print(book.toString())
   //                 }
                    self.bookTableView.reloadData()
                }else{
                    print("Error fetching documents\(error!)")
                    return
                }
            }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookIdentifier", for: indexPath) as! BookTVCell
        
        let book = Books[indexPath.row]
        
        
        
        /*   if let url = URL(string: book.Image) {
         URLSession.shared.dataTask(with: url) { data, response, error in
         guard let data = data, error == nil else {
         print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
         return
         }
         DispatchQueue.main.async {
         cell.BookImage.image = UIImage(data: data)
         }
         }.resume()
         }*/
        // Configure the cell...
        
        cell.BookImage.image=UIImage(systemName:"book.pages.fill")
        
//        if !book.Image.isEmpty && UIImage(named: book.Image) != nil{
//        if let url = URL(string: book.Image){
//        loadImage(from: url, into: cell.BookImage) ///tried to load image from URL in the database but its not loading in UI
//        }
//        cell.BookImage.image = UIImage(named: book.Image)
//        }else{
//         cell.BookImage.image=UIImage(systemName: "book.pages.fill")
//    }
        if let url = URL(string: book.Image), !book.Image.isEmpty {
                cell.BookImage.loadImage(from: url)
            }
        cell.BookName.text = book.Name
        cell.AuthorName.text = book.Author
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath:IndexPath) -> IndexPath? {
        self.selectedBook = Books[indexPath.row]
        return indexPath
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let bookDetailTVC = segue.destination as? BookDetailsTVController {
            bookDetailTVC.books = selectedBook
        }
    }
    

}
extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}


