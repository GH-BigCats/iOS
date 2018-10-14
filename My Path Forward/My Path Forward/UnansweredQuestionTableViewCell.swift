//
//  UnansweredQuestionTableViewCell.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/14/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class UnansweredQuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeOfPost: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
