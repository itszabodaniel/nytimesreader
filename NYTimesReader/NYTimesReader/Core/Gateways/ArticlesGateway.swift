//
//  ArticlesGateway.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

typealias FetchMostPopularArticlesCompletionHandler = (_ articles: [Article]?, _ error: Error?) -> Void

protocol ArticlesGateway {
	func fetchMostPopularArticles(completionHandler: @escaping FetchMostPopularArticlesCompletionHandler)
}
