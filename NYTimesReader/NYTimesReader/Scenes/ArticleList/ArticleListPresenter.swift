//
//  ArticleListPresenter.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

protocol ArticleListView: class {
	func refreshArticlesList()
	func showLoadingIndicator()
	func hideLoadingIndicator()
	func showDetailWithURL(url: URL)
}

protocol ArticleCellView {
	func display(title: String)
	func display(byline: String)
	func display(publishDateString: String)
}

class ArticleListPresenter {
	fileprivate weak var view: ArticleListView?
	fileprivate let displayArticleListInteractor: DisplayArticleListInteractor
	
	private var articles = [Article]()
	
	init(view: ArticleListView,
		 displayArticleListInteractor: DisplayArticleListInteractor = Logic.sharedInstance.displayArticleListInteractor) {
		self.displayArticleListInteractor = displayArticleListInteractor
	}
	
	func viewDidLoad() {
		displayArticleListInteractor.getMostPopularArticles { (articles, error) in
			if let articles = articles {
				self.articles = articles
				self.view?.refreshArticlesList()
			}
		}
	}
	
	func numberOfArticles() -> Int {
		return articles.count
	}
	
	func didSelect(row: Int) {
		let article = articles[row]
		view?.showDetailWithURL(url: article.url)
	}
	
	func configure(cell: ArticleCellView, row: Int) {
		let article = articles[row]
		cell.display(title: article.title)
		cell.display(byline: article.byline)
		cell.display(publishDateString: article.publishDateString)
	}
}
