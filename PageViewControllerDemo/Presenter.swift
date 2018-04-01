//  Presenter.swift
//  Created by Victor Hudson on 3/25/18.
//Copyright © 2018 Victor Hudson. All rights reserved.

import UIKit

class Presenter {
	let pageViewController: UIPageViewController
	
	init(pageViewController: UIPageViewController) {
		self.pageViewController = pageViewController
	}
}

extension Presenter: FlowControllerPresenter  {
	func presentViewController(_ viewController: UIViewController,
							   in direction: FlowPresentationDirection,
							   completion: @escaping (Bool) -> Void) {
		let pageDirection: UIPageViewControllerNavigationDirection = direction == .forward ? .forward : .reverse
		pageViewController.setViewControllers([viewController], direction: pageDirection, animated: true, completion: completion)
	}
}
