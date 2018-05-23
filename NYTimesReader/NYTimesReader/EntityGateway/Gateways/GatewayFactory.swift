//
//  GatewayFactory.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 22..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

class GatewayFactory {
	let pluginFactory: PluginFactory
	
	init(pluginFactory: PluginFactory) {
		self.pluginFactory = pluginFactory
	}
	
	private(set) lazy var articlesGateway: ArticlesGateway = {
		return ApiArticlesGateway(restPlugin: self.pluginFactory.restPlugin)
	}()
}
