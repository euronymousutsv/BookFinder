//
//  CommentTVCell.swift
//  BookFinder
//
//  Created by Utsav on 26/4/2024.
//

import UIKit

class CommentTVCell: UITableViewCell {

    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userComment: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
