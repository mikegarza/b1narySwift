//
//  DecimalController.swift
//  b1nary
//
//  Created by Michael Garza on 1/27/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class DecimalController: UIViewController {
	@IBOutlet private var buttonsContainerView: UIView!
	@IBOutlet private var binaryNumberLabel: UILabel!
	@IBOutlet private var decimalNumberLabel: UILabel!
	@IBOutlet private var hexadecimalNumberLabel: UILabel!
	@IBOutlet private var buttonsBackgroundHeightConstraint: NSLayoutConstraint!
	private var buttonsView: ButtonsView!
	
	private var currentDecimalString: String? = nil

	override func viewDidLoad() {
		super.viewDidLoad()
		
		buttonsView = (Bundle.main.loadNibNamed("ButtonsView", owner: nil, options: nil)!.first as! ButtonsView)
		buttonsContainerView.addSubview(buttonsView)
		buttonsView.delegate = self

		resetAllLabels()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		buttonsBackgroundHeightConstraint.constant = buttonsView.calculateBackgroundViewHeight(view.bounds.width)
		view.setNeedsLayout()
		buttonsView.makeCircleButtons()
	}

	private func decimalDigitPressed(_ buttonTitle: String?) {
		guard let digitString = buttonTitle else { return }
		
//		if let currentString = currentDecimalString {
//			if currentString.count >= 32 {
//				return
//			}
//
//			let newBinaryString = currentString + digitString
//			currentBinaryString = newBinaryString
//			convertAndUpdateLabels(newBinaryString)
//		} else {
//			currentBinaryString = digitString
//			convertAndUpdateLabels(digitString)
//		}
		
		decimalNumberLabel.text = currentDecimalString
	}
	
	private func convertAndUpdateLabels(_ binaryNumber: String) {
		decimalNumberLabel.text = ConversionMath.binaryToDecimal(binaryNumber)
		hexadecimalNumberLabel.text = ConversionMath.binaryToHexadecimal(binaryNumber)
	}

	private func resetAllLabels() {
		decimalNumberLabel.text = "Enter A Decimal Number"
		binaryNumberLabel.text = ""
		hexadecimalNumberLabel.text = ""
	}
}

extension DecimalController: ButtonsViewDelegate {
	func digitPressed(_ digit: String) {
		decimalDigitPressed(digit)
	}
	
	func deletePressed() {
		guard var currentString = currentDecimalString else { return }
		guard !currentString.isEmpty else { return }
		
		_ = currentString.removeLast()
		currentDecimalString = currentString
		
		if currentString.isEmpty {
			resetAllLabels()
		} else {
			decimalNumberLabel.text = currentString
			convertAndUpdateLabels(currentString)
		}
		// Here is a one line version of the if-statement above
		// binaryNumberLabel.text = currentString.isEmpty ? "Enter A Binary Number" : currentString
	}
	
	func clearPressed() {
		currentDecimalString = nil
		resetAllLabels()
	}
}

