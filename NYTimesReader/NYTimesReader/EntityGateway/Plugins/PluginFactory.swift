//
//  PluginFactory.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 22..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

class PluginFactory {
	private(set) lazy var restPlugin: RestPluginProtocol = {
		return DefaultRestPlugin()
	}()
}
