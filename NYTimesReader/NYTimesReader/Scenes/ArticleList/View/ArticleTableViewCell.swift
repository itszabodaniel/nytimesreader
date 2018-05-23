//
//  ArticleTableViewCell.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell, ArticleCellView {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var bylineLabel: UILabel!
	@IBOutlet weak var publishedLabel: UILabel!
	@IBOutlet weak var mediaImageView: UIImageView!
	
	func display(title: String) {
		titleLabel.text = title
	}
	
	func display(byline: String) {
		bylineLabel.text = byline
	}
	
	func display(publishDateString: String) {
		publishedLabel.text = publishDateString
	}
	
	func display(imageURL: URL) {
		mediaImageView.sd_setImage(with: imageURL, completed: nil)
	}
}
