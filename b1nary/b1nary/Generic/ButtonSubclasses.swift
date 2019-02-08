//
//  ButtonSubclasses.swift
//  b1nary
//
//  Created by Michael Garza on 1/4/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import UIKit

class CalculatorCircleButton: UIButton {
	func makeACircle() {
		layer.cornerRadius = bounds.width / 2.0
		layer.masksToBounds = true
	}
}
