//
//  ProgressView.swift
//  FlowControllerDemo
//
//  Created by Victor Hudson on 3/29/18.
//  Copyright © 2018 Victor Hudson. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressView: UIView {
	
	override func draw(_ rect: CGRect) {
		let progressWidth = progress > 0.01 ? (CGFloat(progress) * (rect.width - 8)) : 8
		
		let barBackRect = CGRect(x: 4, y: 2, width: self.bounds.width - 8, height: self.bounds.height - 2)
		let backPath = UIBezierPath(roundedRect: barBackRect, cornerRadius: 4)
		UIColor.lightGray.setFill()
		backPath.fill()
		
		let barRect = CGRect(x: 4, y: 2, width: progressWidth, height: self.bounds.height - 2)
		let barPath = UIBezierPath(roundedRect: barRect, cornerRadius: 4)
		UIColor.blue.setFill()
		barPath.fill()
		UIColor.darkGray.setStroke()
		barPath.lineWidth = 1
		barPath.stroke()
	}
	
	// MARK: - Progress Variables -
	@IBInspectable var progress: Double = 0.0 { didSet { setNeedsDisplay() } }
}
