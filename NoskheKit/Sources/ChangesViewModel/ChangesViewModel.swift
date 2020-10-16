import Foundation
import UIKit

final class ChangesViewModel: NSObject {
	
	private var tableView		: UITableView!
	
	let uiConfiguration	: UIConfiguration
	let versionItems	: [VersionItem]
	
	init(changesData: VersionsData, uiConfiguration: UIConfiguration) {
		self.uiConfiguration = uiConfiguration
		self.versionItems = changesData.versionsItems.map {
			VersionItem(
				title	: uiConfiguration.isRightToLeft
					? $0.number.stringValue.withRightToLeftDigits
					: $0.number.stringValue,
				details	: $0.changes.fullText,
				status	: $0.status
			)
		}
	}
	
	func setupTableView(_ tableView: UITableView) {
		self.tableView = tableView
		tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
		tableView.semanticContentAttribute = uiConfiguration.isRightToLeft
			? .forceRightToLeft
			: .forceLeftToRight
		
		tableView.register(cellClass: FutureVersionCell.self)
		tableView.register(cellType: CurrentVersionCell.self)
		tableView.register(cellClass: OldVersionCell.self)
		tableView.register(cellType: HeaderFooterCell.self)
		
		tableView.contentInset.top = -HeaderFooterCell.Heigth + 100
		tableView.contentInset.bottom = -HeaderFooterCell.Heigth + 100
		
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	func scrollToCurrentVersion() {
		guard let currentVersionRow = versionItems.firstIndex(where: { $0.status == .current })
		else { return }
		let indexPath = IndexPath(row: currentVersionRow + 1, section: 0)
		tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
	}
}

extension ChangesViewModel {
	
	struct VersionItem {
		let title	: String
		let details	: String
		let status	: VersionStatus
	}
}


