import Foundation
import UIKit

extension ChangesViewModel: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 || indexPath.row == versionItems.count + 1 {
			return HeaderFooterCell.Heigth
		}
		
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 || indexPath.row == versionItems.count + 1 {
			return HeaderFooterCell.Heigth
		}
		
		return UITableView.automaticDimension
	}
	
}

