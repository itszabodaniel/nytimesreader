//
//  NYTimesReaderTests.swift
//  NYTimesReaderTests
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import XCTest
@testable import NYTimesReader

class NYTimesReaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDisplayArticleListInteractor() {
		let testBundle = Bundle(for: type(of: self))
		let fileURL = testBundle.url(forResource: "testJson", withExtension: "json")
		XCTAssertNotNil(fileURL)
		let json = try! Data(contentsOf: fileURL!)
		let dummyRestPlugin = DummyRestPlugin(data: json, error: nil)
		let gateway = ApiArticlesGateway(restPlugin: dummyRestPlugin)
		let interactor = DisplayArticleListInteractor(articlesGateway: gateway)
		interactor.getMostPopularArticles { (articles, error) in
			let article = articles!.first!
			let testArticle = Article(id: 100000005903945,
									  title: "We Made a Tool So You Can Hear Both Yanny and Laurel",
									  byline: "By JOSH KATZ, JONATHAN CORUM and JON HUANG",
									  publishDateString: "2018-05-16",
									  url: URL(string: "https://www.nytimes.com/interactive/2018/05/16/upshot/audio-clip-yanny-laurel-debate.html")!,
									  media: [])
			XCTAssertEqual(article, testArticle)
		}
    }
}
