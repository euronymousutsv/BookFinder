//
//  BookTVCell.swift
//  BookFinder
//
//  Created by Utsav on 7/4/2024.
//

import UIKit

class BookTVCell: UITableViewCell {

  
    
    @IBOutlet weak var BookImage: UIImageView!{
        didSet {
                    BookImage.contentMode = .scaleAspectFill // You can change this to .scaleAspectFit or other modes depending on your needs
                    BookImage.clipsToBounds = true
            BookImage.translatesAutoresizingMaskIntoConstraints=false
                }
    }
    
    @IBOutlet weak var BookName: UILabel!
    
    @IBOutlet weak var AuthorName: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
