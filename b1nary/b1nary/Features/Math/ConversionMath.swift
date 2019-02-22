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
	
	private class func hexadecimalDigitsOnly(_ hexadecimalNumber: String) -> String {
		return hexadecimalNumber.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789ABCDEF").inverted)
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
	
	class func decimalToBinary(_ decimalNumber: String) -> String {
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
	
	class func decimalToHexadecimal(_ decimalNumber: String) -> String {
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
	
	class func hexadecimalToBinary(_ hexadecimalNumber: String) -> String {
		guard hexadecimalNumber.count > 0 else { return "0" }
		
		var hexStringIn = hexadecimalDigitsOnly(hexadecimalNumber.uppercased())
		var count = hexStringIn.count
		var convertedString = ""
		
		while count > 0 {
			let firstDigit = hexStringIn.removeFirst()
			
			switch firstDigit {
				case "0":
					convertedString.append("0000")
				case "1":
					convertedString.append("0001")
				case "2":
					convertedString.append("0010")
				case "3":
					convertedString.append("0011")
				case "4":
					convertedString.append("0100")
				case "5":
					convertedString.append("0101")
				case "6":
					convertedString.append("0110")
				case "7":
					convertedString.append("0111")
				case "8":
					convertedString.append("1000")
				case "9":
					convertedString.append("1001")
				case "A":
					convertedString.append("1010")
				case "B":
					convertedString.append("1011")
				case "C":
					convertedString.append("1100")
				case "D":
					convertedString.append("1101")
				case "E":
					convertedString.append("1110")
				case "F":
					convertedString.append("1111")
				default:
					return "ERROR"
			}
			
			count -= 1
		}
		
		while convertedString.count > 1 && convertedString.first == "0" {
			convertedString.removeFirst()
		}
		
		return convertedString
	}
	
	class func hexadecimalToDecimal(_ hexadecimalNumber: String) -> String {
		guard hexadecimalNumber.count > 0 else { return "0" }

		var hexStringIn = hexadecimalDigitsOnly(hexadecimalNumber.uppercased())
		var count = hexStringIn.count
		let base = 16.0
		var exponent = Double(count - 1)
		var total: Int64 = 0
		
		while count > 0 {
			let letter = hexStringIn.removeFirst()
			let power = pow(base, exponent)
			
			switch letter {
				case "A":
					total += Int64(power * 10)
				case "B":
					total += Int64(power * 11)
				case "C":
					total += Int64(power * 12)
				case "D":
					total += Int64(power * 13)
				case "E":
					total += Int64(power * 14)
				case "F":
					total += Int64(power * 15)
				default:
					total += Int64(String(letter))! * Int64(power)
			}
			
			count -= 1
			exponent -= 1
		}
		
		return String(total)
	}
}
