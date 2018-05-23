//
//  ArticleDetailPresenter.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

protocol ArticleDetailView: class {
	func showLoadingIndicator()
	func hideLoadingIndicator()
	func loadURL(url: URL)
}

class ArticleDetailPresenter {
	fileprivate weak var view: ArticleDetailView?
	
	init(view: ArticleDetailView) {
		self.view = view
	}
	
	func setDetailURL(url: URL) {
		view?.showLoadingIndicator()
		view?.loadURL(url: url)
	}
	
	func loadingCompleted() {
		view?.hideLoadingIndicator()
	}
}
