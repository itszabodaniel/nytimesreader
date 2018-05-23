//
//  ArticleTableViewCell.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, ArticleCellView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func display(title: String) {
		
	}
	
	func display(byline: String) {
		
	}
	
	func display(publishDateString: String) {
		
	}
}
