import Foundation

extension Bundle {
	
	static var noskheKit: Bundle {
		return Bundle(for: NoskheKit.self)
	}
	
	public var displayName: String {
		return (object(forInfoDictionaryKey: "CFBundleDisplayName") as! String)
	}
	
	public var versionNumber: String {
		return (object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)
	}

}
