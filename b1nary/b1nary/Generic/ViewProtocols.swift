//
//  ViewProtocols.swift
//  b1nary
//
//  Created by Michael Garza on 1/27/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import Foundation

protocol ButtonsViewDelegate: class {
	func digitPressed(_ digit: String)
	func deletePressed()
	func clearPressed()
	// func savePressed()
	// func pasteButton()
}
