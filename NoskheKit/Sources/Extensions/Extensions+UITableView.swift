import Foundation
import UIKit

extension UITableView {
	
	func register<T: TableViewCell>(cellType: T.Type) {
		let nib = UINib(nibName: cellType.Identifier, bundle: .noskheKit)
		self.register(nib, forCellReuseIdentifier: cellType.Identifier)
	}
	
	func dequeueReusableCell<T: TableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
		return self.dequeueReusableCell(withIdentifier: type.Identifier, for: indexPath) as! T
	}
	
}
