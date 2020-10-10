import Foundation

extension String {
	
	var withRightToLeftDigits: String {
		let rightToLeftDigits = [
			"0": "۰", "1": "۱", "2": "۲", "3": "۳", "4": "۴",
			"5": "۵", "6": "۶", "7": "۷", "8": "۸", "9": "۹",
		]
		return self
			.map { rightToLeftDigits["\($0)", default: "\($0)"] }
			.joined()
	}
	
}
