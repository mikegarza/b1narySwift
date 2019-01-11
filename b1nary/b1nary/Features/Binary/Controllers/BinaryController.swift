//
//  BinaryController.swift
//  b1nary
//
//  Created by Michael Garza on 1/3/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class BinaryController : UIViewController {
	@IBOutlet private var aButton: CalculatorCircleButton!
	@IBOutlet private var bButton: CalculatorCircleButton!
	@IBOutlet private var cButton: CalculatorCircleButton!
	@IBOutlet private var dButton: CalculatorCircleButton!
	@IBOutlet private var eButton: CalculatorCircleButton!
	@IBOutlet private var fButton: CalculatorCircleButton!
	
	@IBOutlet private var zeroButton: CalculatorCircleButton!
	@IBOutlet private var oneButton: CalculatorCircleButton!
	@IBOutlet private var twoButton: CalculatorCircleButton!
	@IBOutlet private var threeButton: CalculatorCircleButton!
	@IBOutlet private var fourButton: CalculatorCircleButton!
	@IBOutlet private var fiveButton: CalculatorCircleButton!
	@IBOutlet private var sixButton: CalculatorCircleButton!
	@IBOutlet private var sevenButton: CalculatorCircleButton!
	@IBOutlet private var eightButton: CalculatorCircleButton!
	@IBOutlet private var nineButton: CalculatorCircleButton!
	
	@IBOutlet private var saveButton: CalculatorCircleButton!
	@IBOutlet private var deleteButton: CalculatorCircleButton!
	@IBOutlet private var clearButton: CalculatorCircleButton!
	@IBOutlet private var pasteButton: CalculatorCircleButton!
	
	@IBOutlet private var binaryNumberLabel: UILabel!
	@IBOutlet private var buttonsBackgroundHeightConstraint: NSLayoutConstraint!
	
	private var currentBinaryString: String? = nil
	
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
	
	private func binaryDigitPressed(_ buttonTitle: String?) {
		guard let digitString = buttonTitle else { return }
		
		if let currentString = currentBinaryString {
			if currentString.count >= 32 {
				return
			}
			
			currentBinaryString = currentString + digitString
		} else {
			currentBinaryString = digitString
		}
		
		binaryNumberLabel.text = currentBinaryString
	}
	
	// MARK: IBActions
	
	@IBAction func digitPressed(_ sender: CalculatorCircleButton) {
		binaryDigitPressed(sender.currentTitle)
	}
	
	@IBAction func deleteButtonPressed(_ sender: CalculatorCircleButton) {
		guard var currentString = currentBinaryString else { return }
		guard !currentString.isEmpty else { return }

		_ = currentString.removeLast()
		currentBinaryString = currentString
		
		if currentString.isEmpty {
			binaryNumberLabel.text = "Enter A Binary Number"
		} else {
			binaryNumberLabel.text = currentString
		}
		// Here is a one line version of the if-statement above
		// binaryNumberLabel.text = currentString.isEmpty ? "Enter A Binary Number" : currentString
	}

	@IBAction func clearButtonPressed(_ sender: CalculatorCircleButton) {
		currentBinaryString = nil
		binaryNumberLabel.text = "Enter A Binary Number"
	}
}
