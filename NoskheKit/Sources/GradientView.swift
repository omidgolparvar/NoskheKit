import Foundation
import UIKit

class GradientView: UIView {
	
	override class var layerClass: AnyClass { CAGradientLayer.self }
	
	private var startColor	: UIColor	= .black
	private var endColor	: UIColor	= .white
	
	private var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
	
	convenience init(frame: CGRect, startColor: UIColor, endColor: UIColor) {
		self.init(frame: frame)
		
		self.startColor	= startColor
		self.endColor	= endColor
	}
	
	private override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupGradeintLayer() {
		gradientLayer.startPoint = .init(x: 0, y: 0)
		gradientLayer.endPoint   = .init(x: 0, y: 1)
		gradientLayer.locations = [0 as NSNumber, 1 as NSNumber]
		gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		setupGradeintLayer()
	}

}
