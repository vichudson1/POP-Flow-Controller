//  FlowControlledViewController.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

protocol FlowControlledViewController where Self: UIViewController {
	var stepCompletionHandler: (() -> Void)? { get set }
}
