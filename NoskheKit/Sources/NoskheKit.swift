import Foundation
import UIKit

internal typealias VersionsData		= NKVersionsData
internal typealias VersionData		= NKVersionData
internal typealias VersionNumber	= NKVersionNumber
internal typealias VersionChanges	= NKVersionChanges
internal typealias VersionStatus	= NKVersionStatus
internal typealias UIConfiguration	= NKUIConfiguration

public class NoskheKit {
	private init() {}
	
	public static func presentChangesController(
		from				sourceController	: UIViewController,
		withData			versionsData		: NKVersionsData,
		andUIConfiguration	uiConfiguration		: NKUIConfiguration) {
		
		let viewModel = ChangesViewModel(
			changesData		: versionsData,
			uiConfiguration	: uiConfiguration
		)
		
		let changesController = NKMainController(viewModel: viewModel)
		changesController.modalPresentationStyle = .formSheet
		
		sourceController.present(changesController, animated: true, completion: nil)
	}
}
