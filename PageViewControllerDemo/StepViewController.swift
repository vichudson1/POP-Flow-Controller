//
//  StepViewController.swift
//  PageViewControllerDemo
//
//  Created by Victor Hudson on 3/25/18.
//  Copyright © 2018 Victor Hudson. All rights reserved.
//

import UIKit

class StepViewController: UIViewController, FlowControlledViewController {
	var stepCompletionHandler: (() -> Void)?
	
	@IBAction func buttonPushed(_ sender: UIButton) {
		stepCompletionHandler?()
	}
}
