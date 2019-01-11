//
//  BinaryController.swift
//  b1nary
//
//  Created by Michael Garza on 1/3/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class BinaryController: UIViewController {
	@IBOutlet var aButton: CalculatorCircleButton!
	@IBOutlet var bButton: CalculatorCircleButton!
	@IBOutlet var cButton: CalculatorCircleButton!
	@IBOutlet var dButton: CalculatorCircleButton!
	@IBOutlet var eButton: CalculatorCircleButton!
	@IBOutlet var fButton: CalculatorCircleButton!
	
	@IBOutlet var zeroButton: CalculatorCircleButton!
	@IBOutlet var oneButton: CalculatorCircleButton!
	@IBOutlet var twoButton: CalculatorCircleButton!
	@IBOutlet var threeButton: CalculatorCircleButton!
	@IBOutlet var fourButton: CalculatorCircleButton!
	@IBOutlet var fiveButton: CalculatorCircleButton!
	@IBOutlet var sixButton: CalculatorCircleButton!
	@IBOutlet var sevenButton: CalculatorCircleButton!
	@IBOutlet var eightButton: CalculatorCircleButton!
	@IBOutlet var nineButton: CalculatorCircleButton!
	
	@IBOutlet var saveButton: CalculatorCircleButton!
	@IBOutlet var deleteButton: CalculatorCircleButton!
	@IBOutlet var clearButton: CalculatorCircleButton!
	@IBOutlet var pasteButton: CalculatorCircleButton!
	
	@IBOutlet var buttonsBackgroundHeightConstraint: NSLayoutConstraint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		calculateBackgroundViewHeight()
		makeCircleButtons()
	}
	
	/// We want our calculator buttons to be perfectly round circles.
	/// We calculate the width of the one button first and use that
	/// to determine the height for the view holding the buttons.
	func calculateBackgroundViewHeight() {
		let paddingCount: CGFloat = 5.0
		let padding: CGFloat = 16.0
		let horizontalButtonCount: CGFloat = 4.0
		
		let buttonsOnlyWidth = view.frame.width - paddingCount * padding
		let buttonWidth = buttonsOnlyWidth /  horizontalButtonCount
		let backgroundHeight = (buttonWidth * paddingCount) + (paddingCount * padding)
		buttonsBackgroundHeightConstraint.constant = backgroundHeight
		view.setNeedsLayout()
	}
	
	func makeCircleButtons() {
		aButton.makeACircle()
		bButton.makeACircle()
		cButton.makeACircle()
		dButton.makeACircle()
		eButton.makeACircle()
		fButton.makeACircle()
		zeroButton.makeACircle()
		oneButton.makeACircle()
		twoButton.makeACircle()
		threeButton.makeACircle()
		fourButton.makeACircle()
		fiveButton.makeACircle()
		sixButton.makeACircle()
		sevenButton.makeACircle()
		eightButton.makeACircle()
		nineButton.makeACircle()
		saveButton.makeACircle()
		deleteButton.makeACircle()
		clearButton.makeACircle()
		pasteButton.makeACircle()
	}
}
