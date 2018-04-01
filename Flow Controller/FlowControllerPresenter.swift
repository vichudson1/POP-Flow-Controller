//  FlowControllerPresenter.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

typealias FlowControllerPresentationCompletionHandler = (Bool) -> Void

protocol FlowControllerPresenter {
	func presentViewController(_ viewController: UIViewController,
							   in direction: FlowPresentationDirection ,
							   completion:  @escaping FlowControllerPresentationCompletionHandler)
}

