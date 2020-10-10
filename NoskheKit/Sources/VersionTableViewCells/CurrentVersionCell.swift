import UIKit

class CurrentVersionCell: VersionTableViewCell {
	
	@IBOutlet weak var view_MainContainer	: UIView!
	@IBOutlet weak var view_Bullet			: UIView!
	@IBOutlet weak var label_WhatsNew		: UILabel!
	
	var whatsNewModel: NKUIConfiguration.CurrentVersionDisplayConfiguration.WhatsNewUIConfiguration?
	
    override func awakeFromNib() {
        super.awakeFromNib()
		view_Bullet.layer.cornerRadius = view_Bullet.frame.height / 2
		let view_BulletSuperview = view_Bullet.superview!
		view_BulletSuperview.layer.cornerRadius = view_BulletSuperview.frame.height / 2
		
		view_MainContainer.layer.cornerRadius = 24
    }
    
	override func setup() {
		super.setup()
		
		if let item = item, item.isRightToLeft {
			view_MainContainer.semanticContentAttribute = .forceRightToLeft
			label_WhatsNew.textAlignment = .right
		}
		
		if let whatsNewModel = whatsNewModel {
			label_WhatsNew.font = item?.titleFont
			label_WhatsNew.text = whatsNewModel.text
			label_WhatsNew.textColor = whatsNewModel.textColor
		} else {
			label_WhatsNew.isHidden = true
		}
	}
}
