//
//  ConversionMath.swift
//  b1nary
//
//  Created by Michael Garza on 1/17/19.
//  Copyright © 2019 Michael Garza. All rights reserved.
//

import Foundation

class ConversionMath {
	private class func binaryDigitsOnly(_ binaryNumber: String) -> String {
		return binaryNumber.trimmingCharacters(in: CharacterSet(charactersIn: "01").inverted)
	}
	
	private class func removeLeadingZeros(_ binaryNumber: String) -> String {
		// TODO: Give this one a try
		// Remove all leading zeros since they do not add any value to the binary number
		// For example: 001100 will become 1100
		return ""
	}
	
	class func binaryToDecimal(_ binaryNumber: String) -> String {
		var localBinary = binaryDigitsOnly(binaryNumber)
		var count = localBinary.count
		
		var exponent = 0.0
		var total = 0.0
		let base = 2.0
		
		while count > 0 {
			let digit = localBinary.removeLast()
			
			if digit == "1" {
				total += pow(base, exponent)
			}
			
			exponent += 1.0
			count -= 1
		}
		
		if let intTotal = Int64(exactly: total) {
			return String(intTotal)
		} else {
			return "ERROR"
		}
	}
	
	class func binaryToHexadecimal(_ binaryNumber: String) -> String {
		guard Int64(binaryNumber) != 0 else { return "0" }
		
		var localBinary = binaryDigitsOnly(binaryNumber)
		var hexadecimalString = ""

		while (localBinary.count % 4) != 0 {
			localBinary = "0" + localBinary
		}
		
		var localBinaryCount = localBinary.count
		
		while localBinaryCount > 0 {
			let decimalSubstring = ConversionMath.binaryToDecimal(String(localBinary.prefix(4)))
			localBinary.removeFirst(4)
			
			if let decimalAsInt = Int(decimalSubstring) {
				if decimalAsInt < 10 {
					hexadecimalString.append(decimalSubstring)
				} else {
					switch decimalSubstring {
						case "10":
							hexadecimalString.append("A")
						case "11":
							hexadecimalString.append("B")
						case "12":
							hexadecimalString.append("C")
						case "13":
							hexadecimalString.append("D")
						case "14":
							hexadecimalString.append("E")
						case "15":
							hexadecimalString.append("F")
						default:
							return "ERROR"
					}
				}
			} else {
				return "ERROR"
			}
			
			localBinaryCount -= 4
		}
		
		return hexadecimalString
	}
	
	func decimalToBinary(_ decimalNumber: String) -> String {
		guard var currentDecimal = Int64(decimalNumber) else { return "ERROR" }
		guard currentDecimal != 0 else { return "0"}
		
		var binaryString = ""

		while currentDecimal != 0 {
			let remainder = currentDecimal % 2
			currentDecimal /= 2
			
			if remainder == 0 {
				binaryString.insert("0", at: binaryString.startIndex)
			} else {
				binaryString.insert("1", at: binaryString.startIndex)
			}
		}
		
		return binaryString
	}
	
	func decimalToHexadecimal(_ decimalNumber: String) -> String {
		guard var currentDecimal = Int64(decimalNumber) else { return "ERROR" }
		guard currentDecimal != 0 else { return "0"}
		
		var hexadecimalString = ""

		while currentDecimal > 0 {
			let remainder = currentDecimal % 16
			currentDecimal /= 16
			
			if remainder < 10 {
				if let string = String(remainder).first {
					hexadecimalString.insert(string, at: hexadecimalString.startIndex)
				} else {
					return "ERROR"
				}
			} else {
				switch remainder {
					case 10:
						hexadecimalString.insert("A", at: hexadecimalString.startIndex)
					case 11:
						hexadecimalString.insert("B", at: hexadecimalString.startIndex)
					case 12:
						hexadecimalString.insert("C", at: hexadecimalString.startIndex)
					case 13:
						hexadecimalString.insert("D", at: hexadecimalString.startIndex)
					case 14:
						hexadecimalString.insert("E", at: hexadecimalString.startIndex)
					case 15:
						hexadecimalString.insert("F", at: hexadecimalString.startIndex)
					default:
						return "ERROR"
				}
			}
		}
		
		return hexadecimalString
	}
}
