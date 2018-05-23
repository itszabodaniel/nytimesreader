//
//  DisplayArticleListInteractor.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

typealias GetMostPopularArticlesCompletionHandler = (_ articles: [Article]?, _ error: Error?) -> Void

class DisplayArticleListInteractor {
	let articlesGateway: ArticlesGateway
	
	init(articlesGateway: ArticlesGateway) {
		self.articlesGateway = articlesGateway
	}
	
	func getMostPopularArticles(completionHandler: @escaping GetMostPopularArticlesCompletionHandler) {
		articlesGateway.fetchMostPopularArticles { (articles, error) in
			completionHandler(articles, error)
		}
	}
}
