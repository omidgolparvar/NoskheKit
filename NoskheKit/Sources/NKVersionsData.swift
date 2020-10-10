import Foundation

public final class NKVersionsData {
	
	let versionsItems	: [NKVersionData]
	
	init(items: [NKVersionData]) {
		let versionsItems = items.sorted { $0.number > $1.number }
		
		self.versionsItems = versionsItems
		
		#if DEBUG
		
		if versionsItems.isEmpty {
			debugPrint("⚠️ NoskheKit.NKVersionsData: There is no version item.")
		} else {
			let numberOfItemsForCurrentVersion = versionsItems
				.filter { $0.status == .current }
				.count
			
			if numberOfItemsForCurrentVersion == 0 {
				debugPrint("⚠️ NoskheKit.NKVersionsData: There is no item for current version.")
			}
			if numberOfItemsForCurrentVersion > 1 {
				debugPrint("⚠️ NoskheKit.NKVersionsData: There is multiple item for current version.")
			}
		}
		
		#endif
	}
	
	public convenience init?(plistFileConfiguration: PlistFileConfiguration) {
		let bundle = plistFileConfiguration.bundle
		let fileName = plistFileConfiguration.fileName
		
		guard let path = bundle.path(forResource: fileName, ofType: "plist"),
			  let nsArray = NSArray(contentsOfFile: path) as? [NSDictionary]
		else { return nil }
		
		let codingKeysType = VersionData.CodingKeys.self
		let items: [VersionData] = nsArray.compactMap { nsDictionary in
			guard let versionString = nsDictionary.object(forKey: codingKeysType.number.rawValue) as? String,
				  let changesStrings = nsDictionary.object(forKey: codingKeysType.changes.rawValue) as? [String],
				  let versionNumber = VersionNumber(string: versionString)
			else { return nil }
			
			let versionChanges = VersionChanges(changes: changesStrings)
			
			return VersionData(number: versionNumber, changes: versionChanges)
		}
		
		self.init(items: items)
	}
	
}


// MARK: Decodable
extension NKVersionsData: Decodable {
	
	public convenience init(from decoder: Decoder) throws {
		let container	= try decoder.container(keyedBy: CodingKeys.self)
		
		let items	= try container.decode([NKVersionData].self, forKey: .versionDataItems)
		
		self.init(items: items)
	}
	
	fileprivate enum CodingKeys: String, CodingKey {
		case versionDataItems = "items"
	}
	
}


// MARK: Models
extension NKVersionsData {
	
	public struct PlistFileConfiguration {
		
		public static let `default` = PlistFileConfiguration(bundle: .main, fileName: "Versions")
		
		let bundle		: Bundle
		let fileName	: String
		
		public init(bundle: Bundle, fileName: String) {
			self.bundle		= bundle
			self.fileName	= fileName
		}
	}
	
}
