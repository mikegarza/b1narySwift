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
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Put your custom viewDidLoad code here
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		makeCircleButtons()
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
