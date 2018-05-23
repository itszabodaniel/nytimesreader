//
//  ApiArticlesGateway.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 22..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

class ApiArticlesGateway: ArticlesGateway {
	let restPlugin: RestPluginProtocol
	
	init(restPlugin: RestPluginProtocol) {
		self.restPlugin = restPlugin
	}
	
	func fetchMostPopularArticles(completionHandler: @escaping FetchMostPopularArticlesCompletionHandler) {
		let url = URL(string: kApiBaseURL + "/mostpopular/v2/mostviewed/all-sections/7.json?api-key=" + kApiKey)!
		restPlugin.getRequestWithURL(url: url, headers: [:]) { (data, error) in
			if let data = data,
			let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
			let jsonDictionary = jsonObject as? Dictionary<String, Any>,
			let results = jsonDictionary["results"] {
				let resultsData = try! JSONSerialization.data(withJSONObject: results , options: [])
				let decoder = JSONDecoder()
				let articles = try! decoder.decode([Article].self, from: resultsData)
				completionHandler(articles, nil)
			} else {
				completionHandler(nil, error)
			}
		}
	}
}
