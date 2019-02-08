//
//  BinaryController.swift
//  b1nary
//
//  Created by Michael Garza on 1/3/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class BinaryController: UIViewController {	
	@IBOutlet private var buttonsContainerView: UIView!
	@IBOutlet private var binaryNumberLabel: UILabel!
	@IBOutlet private var decimalNumberLabel: UILabel!
	@IBOutlet private var hexadecimalNumberLabel: UILabel!
	@IBOutlet private var buttonsBackgroundHeightConstraint: NSLayoutConstraint!
	private var buttonsView: ButtonsView!
	
	private var currentBinaryString: String? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		buttonsView = (Bundle.main.loadNibNamed("ButtonsView", owner: nil, options: nil)!.first as! ButtonsView)
		buttonsContainerView.addSubview(buttonsView)
		buttonsView.style = .binary
		buttonsView.delegate = self

		resetAllLabels()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		buttonsBackgroundHeightConstraint.constant = buttonsView.calculateBackgroundViewHeight(view.bounds.width)
		view.setNeedsLayout()
		buttonsView.makeCircleButtons()
	}
	
	
	private func binaryDigitPressed(_ buttonTitle: String?) {
		guard let digitString = buttonTitle else { return }
		
		if let currentString = currentBinaryString {
			if currentString.count >= 32 {
				return
			}
			
			let newBinaryString = currentString + digitString
			currentBinaryString = newBinaryString
			convertAndUpdateLabels(newBinaryString)
		} else {
			currentBinaryString = digitString
			convertAndUpdateLabels(digitString)
		}
		
		binaryNumberLabel.text = currentBinaryString
	}
	
	private func convertAndUpdateLabels(_ binaryNumber: String) {
		decimalNumberLabel.text = ConversionMath.binaryToDecimal(binaryNumber)
		hexadecimalNumberLabel.text = ConversionMath.binaryToHexadecimal(binaryNumber)
	}
	
	private func resetAllLabels() {
		binaryNumberLabel.text = "Enter A Binary Number"
		decimalNumberLabel.text = ""
		hexadecimalNumberLabel.text = ""
	}
}

extension BinaryController: ButtonsViewDelegate {
	func digitPressed(_ digit: String) {
		binaryDigitPressed(digit)
	}
	
	func deletePressed() {
		guard var currentString = currentBinaryString else { return }
		guard !currentString.isEmpty else { return }
		
		_ = currentString.removeLast()
		currentBinaryString = currentString
		
		if currentString.isEmpty {
			resetAllLabels()
		} else {
			binaryNumberLabel.text = currentString
			convertAndUpdateLabels(currentString)
		}
		// Here is a one line version of the if-statement above
		// binaryNumberLabel.text = currentString.isEmpty ? "Enter A Binary Number" : currentString
	}
	
	func clearPressed() {
		currentBinaryString = nil
		resetAllLabels()
	}
}
