//
//  RestPluginProtocol.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2016. 06. 19..
//  Copyright © 2016. Szabó Dániel. All rights reserved.
//

import Foundation

typealias RestPluginCompletionHandler = (_ data: Data?, _ error: Error?) -> Void

protocol RestPluginProtocol {
    func getRequestWithURL(url: URL, headers: [String: String], completionHandler: @escaping RestPluginCompletionHandler)
    func postRequestWithURL(url: URL, headers: [String: String], body: Data, completionHandler: @escaping RestPluginCompletionHandler)
}
