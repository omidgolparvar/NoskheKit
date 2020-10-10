import Foundation

public final class NKVersionNumber {
	
	public typealias VersionElement = UInt
	
	public let major	: VersionElement
	public let minor	: VersionElement
	public let patch	: VersionElement
	
	public var stringValue: String {
		return "\(major).\(minor).\(patch)"
	}
	
	public convenience init?(string: String) {
		let components = string
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.components(separatedBy: ".")
		guard 1...3 ~= components.count else { return nil }
		
		let major_String = components[0]
		let minor_String = components[1, or: "0"]
		let patch_String = components[2, or: "0"]
		
		guard let major_UInt = UInt(major_String),
			  let minor_UInt = UInt(minor_String),
			  let patch_UInt = UInt(patch_String)
		else { return nil }
		
		self.init(major: major_UInt, minor: minor_UInt, patch: patch_UInt)
	}
	
	public init(major: VersionElement, minor: VersionElement = 0, patch: VersionElement = 0) {
		self.major	= major
		self.minor	= minor
		self.patch	= patch
	}
	
	func status(comparedTo versionNumber: NKVersionNumber) -> NKVersionStatus {
		if self > versionNumber {
			return .future
		}
		if self == versionNumber {
			return .current
		}
		return .old
	}
	
}


// MARK: Equatable
extension NKVersionNumber: Equatable {
	
	public static func == (lhs: NKVersionNumber, rhs: NKVersionNumber) -> Bool {
		return lhs.major == rhs.major
			&& lhs.minor == rhs.minor
			&& lhs.patch == rhs.patch
	}
	
}


// MARK: Comparable
extension NKVersionNumber: Comparable {
	
	public static func < (lhs: NKVersionNumber, rhs: NKVersionNumber) -> Bool {
		if lhs.major < rhs.major {
			return true
		}
		if lhs.major == rhs.major {
			if lhs.minor < rhs.minor {
				return true
			}
			if lhs.minor == rhs.minor {
				return lhs.patch < rhs.patch
			}
			return false
		}
		return false
	}
	
	
}


// MARK: Hashable
extension NKVersionNumber: Hashable {
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(major)
		hasher.combine(minor)
		hasher.combine(patch)
	}
	
}


// MARK: CustomDebugStringConvertible
extension NKVersionNumber: CustomDebugStringConvertible {
	
	public var debugDescription: String {
		return "Version: \(stringValue)"
	}
	
}


// MARK: CustomStringConvertible
extension NKVersionNumber: CustomStringConvertible {
	
	public var description: String {
		return stringValue
	}
	
}


// MARK: Decodable
extension NKVersionNumber: Decodable {
	
	public convenience init(from decoder: Decoder) throws {
		let container	= try decoder.container(keyedBy: CodingKeys.self)
		
		let major		= try container.decode(VersionElement.self, forKey: .major)
		let minor		= try container.decode(VersionElement.self, forKey: .minor)
		let patch		= try container.decode(VersionElement.self, forKey: .patch)
		
		self.init(major: major, minor: minor, patch: patch)
	}
	
	private enum CodingKeys: String, CodingKey {
		case major
		case minor
		case patch
	}
	
}


// MARK: Static Properties
extension NKVersionNumber {
	
	private static var zero: NKVersionNumber {
		return NKVersionNumber(major: 0, minor: 0, patch: 0)
	}
	
	static var current: NKVersionNumber {
		return NKVersionNumber(string: Bundle.main.versionNumber) ?? .zero
	}
	
}
