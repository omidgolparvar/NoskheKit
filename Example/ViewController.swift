import UIKit
import NoskheKit

class ViewController: UIViewController {
	
	@IBOutlet weak var segmentedControl			: UISegmentedControl!
	@IBOutlet weak var buttonPresentNoskheKit	: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		buttonPresentNoskheKit.titleLabel?.font = .vazir(ofSize: 24, weight: .bold)
	}
	
	@IBAction func segmentedControlValueChanged() {
		let buttonTitle: String
		switch segmentedControl.selectedSegmentIndex {
		case 0	: buttonTitle = "Present NoskheKit"
		case 1	: buttonTitle = "نمایش نسخه‌کیت"
		default	: fatalError()
		}
		buttonPresentNoskheKit.setTitle(buttonTitle, for: .normal)
	}
	
	@IBAction func presentNoskheKit() {
		
		let fileName: String
		let isRightToLeft: Bool
		let submitReviewText: String
		let whatsNewText: String
		let whatsNewTextColor: UIColor = {
			if #available(iOS 13, *) {
				return .label
			} else {
				return .black
			}
		}()
		
		switch segmentedControl.selectedSegmentIndex {
		case 0:
			fileName = "Versions-EN"
			isRightToLeft = false
			submitReviewText = "Leave a review"
			whatsNewText = "What's new in"
			
		case 1:
			fileName = "Versions-FA"
			isRightToLeft = true
			submitReviewText = "نظرتون رو ثبت کنین"
			whatsNewText = "تغییرات این نسخه"
			
		default:
			fatalError()
		}
		
		let plistFile = NKVersionsData.PlistFileConfiguration(bundle: .main, fileName: fileName)
		
		guard let versionsData = NKVersionsData(plistFileConfiguration: plistFile)
		else { return }
		
		let uiConfigurattion = NKUIConfiguration()
		uiConfigurattion.isRightToLeft = isRightToLeft
		
		let submitReviewButtonConfiguration = NKUIConfiguration
			.SubmitReviewButtonStatus
			.Configuration(title: submitReviewText)
		submitReviewButtonConfiguration.font = .vazir(ofSize: 20, weight: .bold)
		
		uiConfigurattion.submitReviewButtonStatus = .exist(
			configuration: submitReviewButtonConfiguration
		)
		
		uiConfigurattion.versionsDisplayConfiguration
			.currentVersion
			.whatsNew = .init(text: whatsNewText, textColor: whatsNewTextColor)
		
		uiConfigurattion.versionsDisplayConfiguration
			.currentVersion
			.titleFont = .vazir(ofSize: 22, weight: .bold)
		uiConfigurattion.versionsDisplayConfiguration
			.currentVersion
			.changesFont = .vazir(ofSize: 13, weight: .regular)
		
		uiConfigurattion.versionsDisplayConfiguration
			.otherVersion
			.titleFont = .vazir(ofSize: 15, weight: .bold)
		uiConfigurattion.versionsDisplayConfiguration
			.otherVersion
			.changesFont = .vazir(ofSize: 13, weight: .regular)
		
		NoskheKit.presentChangesController(
			from				: self,
			withData			: versionsData,
			andUIConfiguration	: uiConfigurattion
		)
		
	}

}

