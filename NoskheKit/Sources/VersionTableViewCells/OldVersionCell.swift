//
//  OldVersionCell.swift
//  NoskheKit
//
//  Created by Omid Golparvar on 10/10/20.
//

import UIKit

class OldVersionCell: VersionTableViewCell {
	
	@IBOutlet weak var view_Bullet		: UIView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		view_Bullet.layer.cornerRadius = view_Bullet.frame.height / 2
	}
    
}
