//  FlowController.swift
//  Created by Victor Hudson on 3/25/18.
//  Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

protocol FlowController: class {
	var statusDelegate: FlowControllerStatusDelegate? { get }
	var dataSource: FlowControllerDataSource { get }
	
	var currentStep: Int { get set }
	
	var presenter: FlowControllerPresenter { get set }
	
	init(presenter: FlowControllerPresenter, dataSource: FlowControllerDataSource)
	
	func flowStepsCompleted()
}

// MARK: -
extension FlowController {
	// MARK: - Default Methods
	func startFlow() {
		let vc = viewControllerForStep(0)
		presenter.presentViewController(vc, in: .forward) { (success) in
			
		}
	}
	
	func stepForward() {
		let nextStep = currentStep + 1
		guard nextStep <= maxStepNumber else { return }
		display(viewController: viewControllerForStep(nextStep), direction: .forward)
	}
	
	func stepBackward() {
		let nextStep = currentStep - 1
		guard nextStep >= 0 else { return }
		display(viewController: viewControllerForStep(nextStep), direction: .reverse)
	}
	
	var stepProgressPercentage: Double {
//		guard currentStep > 0 else { return 0.0 }
		return Double(currentStep + 1) / Double(dataSource.numberOfSteps(for: self))
	}
}

// MARK: -
private extension FlowController {
	// MARK: - private members
	func display(viewController: UIViewController, direction: FlowPresentationDirection) {
		presenter.presentViewController(viewController, in: direction) { (success) in
			let currentStep = direction == .forward ? self.currentStep + 1 : self.currentStep - 1
			self.currentStep = currentStep
			self.statusDelegate?.flowStatusChanged(for: self)
		}
	}
	
	func viewControllerForStep(_ step: Int) -> UIViewController {
		if var vc = dataSource.viewControllerForStep(step, for: self) as? FlowControlledViewController {
			vc.stepCompletionHandler = {
				if self.currentStep < self.maxStepNumber {
					self.stepForward()
				} else {
					self.statusDelegate?.flowStatusChanged(for: self)
					self.flowStepsCompleted()
					self.statusDelegate?.flowCompleted(for: self)
				}
			}
			return vc as! UIViewController
		} else {
			fatalError("View Controllers Used in flow must conform to FlowControlledViewController")
		}
	}
	
	var maxStepNumber: Int { return dataSource.numberOfSteps(for: self) - 1 }
}
