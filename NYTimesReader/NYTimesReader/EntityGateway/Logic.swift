//
//  Logic.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 23..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

class Logic {
	static let sharedInstance = Logic()
	private let pluginFactory: PluginFactory
	private let gatewayFactory: GatewayFactory
	
	private init() {
		self.pluginFactory = PluginFactory()
		self.gatewayFactory = GatewayFactory(pluginFactory: pluginFactory)
	}
	
	private(set) lazy var displayArticleListInteractor = {
		return DisplayArticleListInteractor(articlesGateway: self.gatewayFactory.articlesGateway)
	}()
}
