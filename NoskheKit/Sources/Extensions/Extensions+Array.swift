import Foundation

extension Array {
	
	subscript(index: Int, or defaultValue: Element) -> Element {
		return index < count ? self[index] :  defaultValue
	}
	
}
