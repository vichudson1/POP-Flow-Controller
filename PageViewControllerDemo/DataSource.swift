//  DataSource.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

class DataSource: FlowControllerDataSource {
	func numberOfSteps(for controlFlow: FlowController) -> Int {
		return pages.count
	}
	
	func viewControllerForStep(_ step: Int, for flowController: FlowController) -> UIViewController {
		return pages[step]
	}
	
	private lazy var pages: [UIViewController] = {
		return [viewController(withIdentifier: "One"), viewController(withIdentifier: "Two"), viewController(withIdentifier: "Three"), viewController(withIdentifier: "Four")]
	}()
}

// MARK: -
private extension DataSource {
	// MARK: - Private Helper Methods
	func viewController(withIdentifier identifier: String) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
	}
}

