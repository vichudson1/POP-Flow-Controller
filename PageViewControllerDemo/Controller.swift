//  Controller.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import Foundation

class Controller: FlowController {
	
	weak var statusDelegate: FlowControllerStatusDelegate?

	var presenter: FlowControllerPresenter
	var dataSource: FlowControllerDataSource
	var currentStep: Int = 0

	required init(presenter: FlowControllerPresenter, dataSource: FlowControllerDataSource) {
		self.presenter = presenter
		self.dataSource = dataSource
	}
	
	func flowStepsCompleted() {
		print("Flow Steps Completed")
	}
}
