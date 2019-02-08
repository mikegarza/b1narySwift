//
//  ButtonsView.swift
//  b1nary
//
//  Created by Michael Garza on 1/27/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class ButtonsView: UIView {
	enum ButtonsViewStyle {
		case binary
		case decimal
		case hexadecimal
	}
	
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
	
	weak var delegate: ButtonsViewDelegate?
	var style: ButtonsViewStyle = .binary
	
	private let buttonGray = UIColor(red: 54.0/255.0, green: 54.0/255.0, blue: 54.0/255.0, alpha: 1.0)
	private let buttonWhite = UIColor(red: 212.0/255.0, green: 212.0/255.0, blue: 212.0/255.0, alpha: 1.0)

	override func awakeFromNib() {
		super.awakeFromNib()
		
		makeCircleButtons()
	}
	
	/// We want our calculator buttons to be perfectly round circles.
	/// We calculate the width of the one button first and use that
	/// to determine the height for the view holding the buttons.
	func calculateBackgroundViewHeight(_ viewWidth: CGFloat) -> CGFloat {
		let paddingCount: CGFloat = 5.0
		let padding: CGFloat = 16.0
		let horizontalButtonCount: CGFloat = 4.0
		
		let buttonsOnlyWidth = viewWidth - paddingCount * padding
		let buttonWidth = buttonsOnlyWidth / horizontalButtonCount
		let backgroundHeight = (buttonWidth * paddingCount) + (paddingCount * padding)
		return backgroundHeight
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
		
		setupButtons()
	}
	private func setupButtons() {
		switch style {
			case .hexadecimal:
				enableButtons([aButton, bButton, cButton, dButton, eButton, fButton])
				fallthrough
			case .decimal:
				enableButtons([nineButton, eightButton, sevenButton, sixButton, fiveButton, fourButton, threeButton, twoButton])
				fallthrough
			case .binary:
				enableButtons([oneButton, zeroButton, deleteButton, clearButton])
		}
	}

	private func enableButtons(_ buttons: [CalculatorCircleButton]) {
		for button in buttons {
			button.isEnabled = true
			button.setTitleColor(buttonGray, for: .normal)
		}
	}
	
	private func disableButtons(_ buttons: [CalculatorCircleButton]) {
		for button in buttons {
			button.isEnabled = false
			button.setTitleColor(buttonWhite, for: .normal)
		}
	}

	// MARK: IBActions
	
	@IBAction func digitPressed(_ sender: CalculatorCircleButton) {
		if let digit = sender.currentTitle {
			delegate?.digitPressed(digit)
		}
	}
	
	@IBAction func deleteButtonPressed(_ sender: CalculatorCircleButton) {
		delegate?.deletePressed()
	}
	
	@IBAction func clearButtonPressed(_ sender: CalculatorCircleButton) {
		delegate?.clearPressed()
	}

}
