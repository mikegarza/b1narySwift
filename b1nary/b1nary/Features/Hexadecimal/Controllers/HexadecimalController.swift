//
//  HexadecimalController.swift
//  b1nary
//
//  Created by Michael Garza on 2/7/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class HexadecimalController: UIViewController {
	@IBOutlet private var buttonsContainerView: UIView!
	@IBOutlet private var binaryNumberLabel: UILabel!
	@IBOutlet private var decimalNumberLabel: UILabel!
	@IBOutlet private var hexadecimalNumberLabel: UILabel!
	@IBOutlet private var buttonsBackgroundHeightConstraint: NSLayoutConstraint!
	
	private var buttonsView: ButtonsView!
	private var currentHexadecimalString: String? = nil

	override func viewDidLoad() {
		super.viewDidLoad()
		
		buttonsView = (Bundle.main.loadNibNamed("ButtonsView", owner: nil, options: nil)!.first as! ButtonsView)
		buttonsContainerView.addSubview(buttonsView)
		buttonsView.style = .hexadecimal
		buttonsView.delegate = self
		
		resetAllLabels()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		buttonsBackgroundHeightConstraint.constant = buttonsView.calculateBackgroundViewHeight(view.bounds.width)
		view.setNeedsLayout()
		buttonsView.makeCircleButtons()
	}

	private func hexadecimalDigitPressed(_ buttonTitle: String?) {
		guard let digitString = buttonTitle else { return }
		
		if let currentString = currentHexadecimalString {
			let newHexadecimalString = currentString + digitString
			guard newHexadecimalString.count <= 8 else { return }
			
			currentHexadecimalString = newHexadecimalString
			convertAndUpdateLabels(newHexadecimalString)
		} else {
			currentHexadecimalString = digitString
			convertAndUpdateLabels(digitString)
		}
		
		hexadecimalNumberLabel.text = currentHexadecimalString
	}
	
	private func convertAndUpdateLabels(_ hexadecimalNumber: String) {
		binaryNumberLabel.text = ConversionMath.hexadecimalToBinary(hexadecimalNumber)
		decimalNumberLabel.text = ConversionMath.hexadecimalToDecimal(hexadecimalNumber)
	}

	private func resetAllLabels() {
		hexadecimalNumberLabel.text = "Enter A Hexadecimal Number"
		decimalNumberLabel.text = ""
		binaryNumberLabel.text = ""
	}
}

extension HexadecimalController: ButtonsViewDelegate {
	func digitPressed(_ digit: String) {
		hexadecimalDigitPressed(digit)
	}
	
	func deletePressed() {
		guard var currentString = currentHexadecimalString else { return }
		guard !currentString.isEmpty else { return }
		
		_ = currentString.removeLast()
		currentHexadecimalString = currentString
		
		if currentString.isEmpty {
			resetAllLabels()
		} else {
			hexadecimalNumberLabel.text = currentString
			convertAndUpdateLabels(currentString)
		}
	}
	
	func clearPressed() {
		currentHexadecimalString = nil
		resetAllLabels()
	}
}

