import Foundation
import UIKit

public final class NKUIConfiguration {
	public var isRightToLeft				: Bool
	public var submitReviewButtonStatus		: SubmitReviewButtonStatus
	public var versionsDisplayConfiguration	: VersionsDisplayConfiguration
	
	public init() {
		isRightToLeft					= false
		submitReviewButtonStatus		= .notExist
		versionsDisplayConfiguration	= .init()
	}
}

public extension NKUIConfiguration {
	
	enum SubmitReviewButtonStatus {
		case exist(configuration: Configuration)
		case notExist
		
		public final class Configuration {
			public let title			: String
			public var font				: UIFont
			public var backgroundColor	: UIColor
			public var textColor		: UIColor
			
			public init(title: String) {
				self.title = title
				self.font = .systemFont(ofSize: 20, weight: .bold)
				
				if #available(iOS 13, *) {
					backgroundColor = .systemBlue
				} else {
					backgroundColor = .blue
				}
				
				textColor = .white
			}
		}
	}
	
	class VersionsDisplayConfiguration {
		public var currentVersion	: CurrentVersionDisplayConfiguration
		public var otherVersion		: OtherVersionDisplayConfiguration
		
		public init() {
			currentVersion = .init()
			otherVersion = .init()
		}
		
	}
	
}

protocol VersionDisplayConfigurationProtocol {
	var titleColor		: UIColor { get set }
	var titleFont		: UIFont { get set }
	var changesColor	: UIColor { get set }
	var changesFont		: UIFont { get set }
}

public extension NKUIConfiguration {
	
	class CurrentVersionDisplayConfiguration: VersionDisplayConfigurationProtocol {
		public var whatsNew		: WhatsNewUIConfiguration?
		public var titleColor	: UIColor
		public var titleFont	: UIFont
		public var changesColor	: UIColor
		public var changesFont	: UIFont
		
		public init() {
			whatsNew = nil
			
			let _titleFont		= UIFont.systemFont(ofSize: 22, weight: .bold)
			let _changesFont	= UIFont.systemFont(ofSize: 14, weight: .regular)
			
			if #available(iOS 13, *) {
				titleColor		= .systemBlue
				titleFont		= _titleFont
				changesColor	= .label
				changesFont		= _changesFont
				
			} else {
				titleColor		= .blue
				titleFont		= _titleFont
				changesColor	= .black
				changesFont		= _changesFont
			}
		}
		
		public struct WhatsNewUIConfiguration {
			public var text			: String
			public var textColor	: UIColor
			
			public init(text: String, textColor: UIColor) {
				self.text		= text
				self.textColor	= textColor
			}
		}
		
	}
	
	class OtherVersionDisplayConfiguration: VersionDisplayConfigurationProtocol {
		public var titleColor	: UIColor
		public var titleFont	: UIFont
		public var changesColor	: UIColor
		public var changesFont	: UIFont
		
		public init() {
			let _titleFont		= UIFont.systemFont(ofSize: 15, weight: .bold)
			let _changesFont	= UIFont.systemFont(ofSize: 13, weight: .medium)
			
			if #available(iOS 13, *) {
				titleColor		= .systemBlue
				titleFont		= _titleFont
				changesColor	= .systemGray
				changesFont		= _changesFont
				
			} else {
				titleColor		= .blue
				titleFont		= _titleFont
				changesColor	= .darkGray
				changesFont		= _changesFont
			}
			
		}
		
	}
	
}

