import UIKit

class CurrentVersionCell: VersionTableViewCell {
	
	private let view_MainContainerView	: UIView = {
		let _view = UIView(frame: .zero)
		_view.translatesAutoresizingMaskIntoConstraints = false
		_view.layer.cornerRadius = 24
		
		if #available(iOS 13, *) {
			_view.backgroundColor = .secondarySystemBackground
		} else {
			_view.backgroundColor = .groupTableViewBackground
		}
		
		return _view
	}()
	private let view_BulletHolderView	: UIView = {
		let _view = UIView(frame: .zero)
		_view.translatesAutoresizingMaskIntoConstraints = false
		_view.layer.cornerRadius = 12
		
		if #available(iOS 13, *) {
			_view.backgroundColor = .systemBackground
		} else {
			_view.backgroundColor = .white
		}
		
		return _view
	}()
	private let view_BulletView			: UIView = {
		let _view = UIView(frame: .zero)
		_view.translatesAutoresizingMaskIntoConstraints = false
		_view.layer.cornerRadius = 6
		
		if #available(iOS 13, *) {
			_view.backgroundColor = .systemBlue
		} else {
			_view.backgroundColor = .blue
		}
		
		return _view
	}()
	private let stackView_Texts			: UIStackView = {
		let _stackView = UIStackView(frame: .zero)
		_stackView.translatesAutoresizingMaskIntoConstraints = false
		_stackView.axis = .vertical
		_stackView.alignment = .fill
		_stackView.distribution = .fill
		_stackView.spacing = 0
		
		return _stackView
	}()
	private let label_Title_			: UILabel = {
		let _label = UILabel(frame: .zero)
		_label.translatesAutoresizingMaskIntoConstraints = false
		_label.font = .systemFont(ofSize: 22, weight: .bold)
		
		if #available(iOS 13, *) {
			_label.textColor = .systemBlue
		} else {
			_label.textColor = .blue
		}
		
		return _label
	}()
	private let label_Details_			: UILabel = {
		let _label = UILabel(frame: .zero)
		_label.translatesAutoresizingMaskIntoConstraints = false
		_label.font = .systemFont(ofSize: 16, weight: .medium)
		_label.numberOfLines = 0
		
		if #available(iOS 13, *) {
			_label.textColor = .label
		} else {
			_label.textColor = .black
		}
		
		return _label
	}()
	private let label_WhatsNew			: UILabel = {
		let _label = UILabel(frame: .zero)
		_label.translatesAutoresizingMaskIntoConstraints = false
		_label.text = "What's new in"
		_label.font = .systemFont(ofSize: 22, weight: .bold)
		
		if #available(iOS 13, *) {
			_label.textColor = .label
		} else {
			_label.textColor = .black
		}
		
		return _label
	}()
	
	var whatsNewModel: NKUIConfiguration.CurrentVersionDisplayConfiguration.WhatsNewUIConfiguration?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		func _setupMainContainerView() {
			contentView.addSubview(view_MainContainerView)
			
			NSLayoutConstraint.activate([
				view_MainContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
				view_MainContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
				view_MainContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
				view_MainContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			])
		}
		func _setupBulletView() {
			view_MainContainerView.addSubview(view_BulletHolderView)
			view_BulletHolderView.addSubview(view_BulletView)
			
			NSLayoutConstraint.activate([
				view_BulletHolderView.widthAnchor.constraint(equalToConstant: 24),
				view_BulletHolderView.heightAnchor.constraint(equalToConstant: 24),
				view_BulletHolderView.leadingAnchor.constraint(equalTo: view_MainContainerView.leadingAnchor, constant: 12),
				
				view_BulletView.widthAnchor.constraint(equalToConstant: 12),
				view_BulletView.heightAnchor.constraint(equalToConstant: 12),
				view_BulletView.centerXAnchor.constraint(equalTo: view_BulletHolderView.centerXAnchor, constant: 0),
				view_BulletView.centerYAnchor.constraint(equalTo: view_BulletHolderView.centerYAnchor, constant: 0),
			])
			
		}
		func _setupStackView() {
			view_MainContainerView.addSubview(stackView_Texts)
			
			stackView_Texts.addArrangedSubview(label_WhatsNew)
			stackView_Texts.addArrangedSubview(label_Title_)
			
			NSLayoutConstraint.activate([
				stackView_Texts.topAnchor.constraint(equalTo: view_MainContainerView.topAnchor, constant: 24),
				stackView_Texts.leadingAnchor.constraint(equalTo: view_BulletHolderView.trailingAnchor, constant: 12),
				stackView_Texts.trailingAnchor.constraint(equalTo: view_MainContainerView.trailingAnchor, constant: -24),
				
				view_BulletHolderView.centerYAnchor.constraint(equalTo: stackView_Texts.centerYAnchor, constant: 0),
			])
		}
		func _setupWhatsNewLabel() {
			label_WhatsNew.setContentHuggingPriority(.init(251), for: .vertical)
		}
		func _setupTitleLabel() {
			label_Title_.setContentHuggingPriority(.init(251), for: .vertical)
			
			self.label_Title = label_Title_
		}
		func _setuoDetailsLabel() {
			view_MainContainerView.addSubview(label_Details_)
			
			label_Details_.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
			
			NSLayoutConstraint.activate([
				label_Details_.leadingAnchor.constraint(equalTo: stackView_Texts.leadingAnchor, constant: 0),
				label_Details_.trailingAnchor.constraint(equalTo: stackView_Texts.trailingAnchor, constant: 0),
				label_Details_.topAnchor.constraint(equalTo: stackView_Texts.bottomAnchor, constant: 12),
				label_Details_.bottomAnchor.constraint(equalTo: view_MainContainerView.bottomAnchor, constant: -24),
			])
			
			self.label_Details = label_Details_
		}
		
		_setupMainContainerView()
		_setupBulletView()
		_setupStackView()
		_setupWhatsNewLabel()
		_setupTitleLabel()
		_setuoDetailsLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func setup() {
		super.setup()
		
		if let item = item, item.isRightToLeft {
			view_MainContainerView.semanticContentAttribute = .forceRightToLeft
			label_WhatsNew.textAlignment = .right
		}
		
		if let whatsNewModel = whatsNewModel {
			label_WhatsNew.font = item?.titleFont
			label_WhatsNew.text = whatsNewModel.text
			label_WhatsNew.textColor = whatsNewModel.textColor
		} else {
			label_WhatsNew.isHidden = true
		}
	}
	
}
