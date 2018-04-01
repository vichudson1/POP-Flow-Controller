//
//  ContainerViewController.swift
//  PageViewControllerDemo
//
//  Created by Victor Hudson on 3/25/18.
//  Copyright © 2018 Victor Hudson. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
	
	@IBOutlet var containerView: UIView!
	@IBOutlet var percentageLabel: UILabel!
	
	@IBOutlet var progressView: ProgressView!
	@IBOutlet var stepper: UIStepper!
	@IBAction func stepperChanged(_ sender: UIStepper) {
		sender.value > currentStepperValue ? controller.stepForward() : controller.stepBackward()
		currentStepperValue = sender.value
	}
	
	var currentStepperValue = 0.0
	
	var pageViewController: UIPageViewController!
	
	
	lazy var controller: Controller = {
		let controller = Controller(presenter: Presenter(pageViewController: pageViewController),
									dataSource: DataSource())
		controller.statusDelegate = self
		return controller
	}()
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if segue.identifier == "thePager", let pager = segue.destination as? UIPageViewController {
			pageViewController = pager
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		controller.startFlow()
		stepper.maximumValue = Double(controller.dataSource.numberOfSteps(for: controller))
		percentageLabel.text = "Percentage Complete: \(controller.stepProgressPercentage)"
		progressView.progress = controller.stepProgressPercentage
	}
}

// MARK: -
extension ContainerViewController: FlowControllerStatusDelegate {
	func flowCompleted(for flowController: FlowController) {
		dismiss(animated: true, completion: nil)
	}
	
	// MARK: - FlowControllerStatusDelegate

	func flowStatusChanged(for flowController: FlowController) {
		percentageLabel.text = "Percentage Complete: \(flowController.stepProgressPercentage)"
		progressView.progress = flowController.stepProgressPercentage
		stepper.value = Double(flowController.currentStep)
	}
}


