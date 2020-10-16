import UIKit

class FutureVersionCell: OldVersionCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let bulletViewBackgroundColor: UIColor
		if #available(iOS 13, *) {
			bulletViewBackgroundColor = .systemBlue
		} else {
			bulletViewBackgroundColor = .blue
		}
		setBulletViewColor(to: bulletViewBackgroundColor)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
