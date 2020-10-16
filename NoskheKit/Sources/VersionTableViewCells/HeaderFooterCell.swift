import UIKit

class HeaderFooterCell: TableViewCell {
	
	static let Heigth	: CGFloat = 1_000
	
	private let view_LineView			: UIView = {
		let _view = UIView(frame: .zero)
		_view.translatesAutoresizingMaskIntoConstraints = false
		
		if #available(iOS 13, *) {
			_view.backgroundColor = .systemGray5
		} else {
			_view.backgroundColor = .init(hex: 0xE5E5EA)
		}
		
		return _view
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		func _setupLineView() {
			contentView.addSubview(view_LineView)
			
			NSLayoutConstraint.activate([
				view_LineView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
				view_LineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
				view_LineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
				view_LineView.widthAnchor.constraint(equalToConstant: 3),
			])
		}
		
		_setupLineView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
