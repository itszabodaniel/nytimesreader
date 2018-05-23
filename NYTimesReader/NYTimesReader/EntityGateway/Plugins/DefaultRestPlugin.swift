//
//  DefaultRestPlugin.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2016. 06. 19..
//  Copyright © 2016. Szabó Dániel. All rights reserved.
//

import Foundation

class DefaultRestPlugin: RestPluginProtocol {
	func getRequestWithURL(url: URL, headers: [String: String], completionHandler: @escaping RestPluginCompletionHandler) {
		let configuration = URLSessionConfiguration.default
        
		let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.current)
		let request = NSMutableURLRequest(url: url as URL)
        request.allHTTPHeaderFields = headers
        
		let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
			completionHandler(data, error)
        }
        dataTask.resume()
    }
	
	func postRequestWithURL(url: URL, headers: [String: String], body: Data, completionHandler: @escaping RestPluginCompletionHandler) {
		let configuration = URLSessionConfiguration.default
        
		let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.current)
        
		let request = NSMutableURLRequest(url: url as URL)
		request.httpMethod = "POST"
		request.httpBody = body as Data
        
        request.allHTTPHeaderFields = headers
        
		let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
			completionHandler(data, error)
        }
        dataTask.resume()
    }}
