//
//  ArticleListPresenterTests.swift
//  NYTimesReaderTests
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import XCTest
@testable import NYTimesReader

class ArticleListPresenterTests: XCTestCase, ArticleCellView, ArticleListView {
	
	func testArticleListPresenter() {
		let testBundle = Bundle(for: type(of: self))
		let fileURL = testBundle.url(forResource: "testJson", withExtension: "json")
		XCTAssertNotNil(fileURL)
		let json = try! Data(contentsOf: fileURL!)
		let dummyRestPlugin = DummyRestPlugin(data: json, error: nil)
		let gateway = ApiArticlesGateway(restPlugin: dummyRestPlugin)
		let interactor = DisplayArticleListInteractor(articlesGateway: gateway)
		
		let articleListPresenter = ArticleListPresenter(view: self, displayArticleListInteractor: interactor)
		articleListPresenter.viewDidLoad()
		articleListPresenter.configure(cell: self, row: 0)
		articleListPresenter.didSelect(row: 0)
		
		XCTAssertEqual(articleListPresenter.numberOfArticles(), 1)
	}
	
	func showDetailWithURL(url: URL, title: String) {
		XCTAssertEqual(url, URL(string: "https://www.nytimes.com/interactive/2018/05/16/upshot/audio-clip-yanny-laurel-debate.html"))
		XCTAssertEqual(title, "We Made a Tool So You Can Hear Both Yanny and Laurel")
	}
	
	func display(title: String) {
		XCTAssertEqual(title, "We Made a Tool So You Can Hear Both Yanny and Laurel")
	}
	
	func display(byline: String) {
		XCTAssertEqual(byline, "By JOSH KATZ, JONATHAN CORUM and JON HUANG")
	}
	
	func display(publishDateString: String) {
		XCTAssertEqual(publishDateString, "2018-05-16")
	}
	
	func display(imageURL: URL) {
		
	}
	
	func refreshArticlesList() {
		
	}
	
	func showLoadingIndicator() {
		
	}
	
	func hideLoadingIndicator() {
		
	}
	
	func showErrorDialog(error: Error) {
		
	}
}
