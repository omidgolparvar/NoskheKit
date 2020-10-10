import Foundation

public final class NKVersionData {
	
	public let number	: NKVersionNumber
	public let changes	: NKVersionChanges
	public let status	: NKVersionStatus
	
	public init(number: NKVersionNumber, changes: NKVersionChanges) {
		self.number		= number
		self.changes	= changes
		self.status		= number.status(comparedTo: .current)
	}
	
}


// MARK: Equatable
extension NKVersionData: Equatable {
	
	public static func == (lhs: NKVersionData, rhs: NKVersionData) -> Bool {
		return lhs.number == rhs.number
	}
	
}


// MARK: Hashable
extension NKVersionData: Hashable {
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(number.hashValue)
	}
	
}


// MARK: CustomDebugStringConvertible
extension NKVersionData: CustomDebugStringConvertible {
	
	public var debugDescription: String {
		let versionChanges = changes.prefixedChanges
			.map { "  \($0)"}
			.joined(separator: "\n")
		
		return """
			VersionData:
			- Version Number: \(number.description)
			- Version Changes:
			\(versionChanges)
			"""
	}
	
}


// MARK: CustomStringConvertible
extension NKVersionData: CustomStringConvertible {
	
	public var description: String {
		return """
			\(number.description):
			\(changes.description)
			"""
	}
	
}


// MARK: Decodable
extension NKVersionData: Decodable {
	
	public convenience init(from decoder: Decoder) throws {
		let container	= try decoder.container(keyedBy: CodingKeys.self)
		
		let number	= try container.decode(NKVersionNumber.self, forKey: .number)
		let changes	= try container.decode(NKVersionChanges.self, forKey: .changes)
		
		self.init(number: number, changes: changes)
	}
	
	enum CodingKeys: String, CodingKey {
		case number
		case changes
	}
	
}
