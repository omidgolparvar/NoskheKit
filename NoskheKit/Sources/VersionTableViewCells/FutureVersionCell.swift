import UIKit

class FutureVersionCell: VersionTableViewCell {
	
	@IBOutlet weak var view_Bullet		: UIView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		view_Bullet.layer.cornerRadius = view_Bullet.frame.height / 2
    }
    
}
