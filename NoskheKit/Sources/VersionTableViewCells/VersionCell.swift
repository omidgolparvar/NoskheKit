import Foundation
import UIKit

class VersionTableViewCell: TableViewCell {
	
	@IBOutlet weak var label_Title		: UILabel!
	@IBOutlet weak var label_Details	: UILabel!
	
	var item: Item? {
		didSet {
			_ = oldValue
			setup()
		}
	}
	
	func setup() {
		guard let item = item else { return }
		
		label_Title.text		= item.title
		label_Title.textColor	= item.titleColor
		label_Title.font		= item.titleFont
		
		label_Details.text		= item.details
		label_Details.textColor	= item.detailsColor
		label_Details.font		= item.detailsFont
		
		if item.isRightToLeft {
			label_Title.textAlignment = .right
			label_Details.textAlignment = .right
		}
	}
	
}


// MARK: Models
extension VersionTableViewCell {
	
	struct Item {
		let title			: String
		let titleColor		: UIColor
		let titleFont		: UIFont
		let details			: String
		let detailsColor	: UIColor
		let detailsFont		: UIFont
		let isRightToLeft	: Bool
	}
	
}


