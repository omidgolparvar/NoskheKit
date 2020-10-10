import Foundation

final class NKVersionChanges {
	
	let changes	: [String]
	
	var prefixedChanges: [String] {
		return changes.map { "\(Self.PrefixCharacter) \($0)" }
	}
	
	var fullText: String {
		return prefixedChanges.joined(separator: "\n")
	}
	
	init(changes: [String]) {
		self.changes	= changes.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
	}
	
}


// MARK: CustomDebugStringConvertible
extension NKVersionChanges: CustomDebugStringConvertible {
	
	var debugDescription: String {
		let changes = prefixedChanges.joined(separator: "\n")
		return """
			Changes:
			\(changes)
			"""
	}
	
}


// MARK: CustomStringConvertible
extension NKVersionChanges: CustomStringConvertible {
	
	var description: String {
		return fullText
	}
	
}


// MARK: Decodable
extension NKVersionChanges: Decodable {
	
	convenience init(from decoder: Decoder) throws {
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
	
	static var PrefixCharacter	: Character = "•"
	
}
