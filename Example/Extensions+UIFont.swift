//
//  Extensions+UIFont.swift
//  Example
//
//  Created by Omid Golparvar on 10/10/20.
//

import Foundation
import UIKit

extension UIFont {
	
	static func vazir(ofSize size: CGFloat, weight: Weight = .regular) -> UIFont {
		switch weight {
		case .black, .bold, .heavy, .medium, .semibold:
			return UIFont(name: "Vazir-Bold", size: size)!
		case .regular, .light, .thin, .ultraLight:
			return UIFont(name: "Vazir", size: size)!
		default:
			return UIFont(name: "Vazir", size: size)!
		}
	}
	
}
