import Foundation
import UIKit

extension ChangesViewModel: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return versionItems.count + 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 || indexPath.row == versionItems.count + 1 {
			let cell = tableView.dequeueReusableCell(HeaderFooterCell.self, for: indexPath)
			return cell
		}
		
		let versionsDisplayConfiguration = uiConfiguration.versionsDisplayConfiguration
		let versionItem = versionItems[indexPath.row - 1]
		
		let cell: VersionTableViewCell
		let cellUIConfiguration: VersionDisplayConfigurationProtocol
		
		switch versionItem.status {
		case .future:
			cell = tableView.dequeueReusableCell(FutureVersionCell.self, for: indexPath)
			cellUIConfiguration = versionsDisplayConfiguration
				.otherVersion
			
		case .current:
			cell = tableView.dequeueReusableCell(CurrentVersionCell.self, for: indexPath)
			(cell as! CurrentVersionCell).whatsNewModel = versionsDisplayConfiguration
				.currentVersion
				.whatsNew
			cellUIConfiguration = versionsDisplayConfiguration
				.currentVersion
			
		case .old:
			cell = tableView.dequeueReusableCell(OldVersionCell.self, for: indexPath)
			cellUIConfiguration = uiConfiguration
				.versionsDisplayConfiguration
				.otherVersion
		}
		
		
		cell.item = .init(
			title			: versionItem.title,
			titleColor		: cellUIConfiguration.titleColor,
			titleFont		: cellUIConfiguration.titleFont,
			details			: versionItem.details,
			detailsColor	: cellUIConfiguration.changesColor,
			detailsFont		: cellUIConfiguration.changesFont,
			isRightToLeft	: uiConfiguration.isRightToLeft
		)
		
		return cell
	}
	
}
