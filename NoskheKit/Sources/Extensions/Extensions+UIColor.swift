import Foundation
import UIKit

extension UIColor {
	
	convenience init(hex: String) {
		var colorCode = hex
		
		if (colorCode.hasPrefix("#")) {
			let startIndex = colorCode.index(colorCode.startIndex, offsetBy: 1)
			colorCode = String(colorCode[startIndex...])
		}
		
		var rgbValue: UInt32 = 0
		Scanner(string: colorCode).scanHexInt32(&rgbValue)
		
		self.init(
			red		: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green	: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue	: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha	: 1.0
		)
	}
	
	convenience init(hex: UInt) {
		self.init(
			red		: CGFloat((hex & 0xFF0000) >> 16) / 255,
			green	: CGFloat((hex & 0xFF00) >> 8) / 255,
			blue	: CGFloat(hex & 0xFF) / 255,
			alpha	: 1.0
		)
	}
	
}
