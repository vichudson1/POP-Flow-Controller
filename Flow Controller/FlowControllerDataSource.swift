//  FlowControllerDataSource.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

protocol FlowControllerDataSource: class {
	func numberOfSteps(for controlFlow: FlowController) -> Int
	func viewControllerForStep(_ step: Int, for flowController: FlowController) -> UIViewController
}

