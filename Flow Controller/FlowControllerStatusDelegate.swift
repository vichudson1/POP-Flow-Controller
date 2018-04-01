//  FlowControllerStatusDelegate.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import Foundation

protocol FlowControllerStatusDelegate: class {
	func flowStatusChanged(for flowController: FlowController)
	func flowCompleted(for flowController: FlowController)
}

