//
//  DummyRestPlugin.swift
//  NYTimesReaderTests
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation


class DummyRestPlugin: RestPluginProtocol {
	var data: Data?
	var error: Error?
	
	init(data: Data?, error: Error?) {
		self.data = data
		self.error = error
	}
	
	func getRequestWithURL(url: URL, headers: [String : String], completionHandler: @escaping RestPluginCompletionHandler) {
		completionHandler(data, error)
	}
	
	func postRequestWithURL(url: URL, headers: [String : String], body: Data, completionHandler: @escaping RestPluginCompletionHandler) {
		completionHandler(data, error)
	}
}
