import Foundation

public final class NKVersionChanges {
	
	public let changes	: [String]
	
	public var prefixedChanges: [String] {
		return changes.map { "\(Self.PrefixCharacter) \($0)" }
	}
	
	public var fullText: String {
		return prefixedChanges.joined(separator: "\n")
	}
	
	public init(changes: [String]) {
		self.changes	= changes.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
	}
	
}


// MARK: CustomDebugStringConvertible
extension NKVersionChanges: CustomDebugStringConvertible {
	
	public var debugDescription: String {
		let changes = prefixedChanges.joined(separator: "\n")
		return """
			Changes:
			\(changes)
			"""
	}
	
}


// MARK: CustomStringConvertible
extension NKVersionChanges: CustomStringConvertible {
	
	public var description: String {
		return fullText
	}
	
}


// MARK: Decodable
extension NKVersionChanges: Decodable {
	
	public convenience init(from decoder: Decoder) throws {
		let container	= try decoder.container(keyedBy: CodingKeys.self)
		
		let changes		= try container.decode([String].self, forKey: .changes)
		
		self.init(changes: changes)
	}
	
	private enum CodingKeys: String, CodingKey {
		case changes
	}
	
}


// MARK: Static Functions
extension NKVersionChanges {
	
	public static var PrefixCharacter	: Character = "•"
	
}
