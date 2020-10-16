//
//  OldVersionCell.swift
//  NoskheKit
//
//  Created by Omid Golparvar on 10/10/20.
//

import UIKit

class OldVersionCell: VersionTableViewCell {
	
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
	private let view_BulletHolderView	: UIView = {
		let _view = UIView(frame: .zero)
		_view.translatesAutoresizingMaskIntoConstraints = false
		
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
			_view.backgroundColor = .systemGray5
		} else {
			_view.backgroundColor = .init(hex: 0xE5E5EA)
		}
		
		return _view
	}()
	private let label_Title_			: UILabel = {
		let _label = UILabel(frame: .zero)
		_label.translatesAutoresizingMaskIntoConstraints = false
		_label.font = .systemFont(ofSize: 15, weight: .bold)
		
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
		_label.font = .systemFont(ofSize: 13, weight: .medium)
		_label.numberOfLines = 0
		
		if #available(iOS 13, *) {
			_label.textColor = .secondaryLabel
		} else {
			_label.textColor = .lightGray
		}
		
		return _label
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
		func _setupBulletView() {
			contentView.addSubview(view_BulletHolderView)
			view_BulletHolderView.addSubview(view_BulletView)
			
			NSLayoutConstraint.activate([
				view_BulletHolderView.widthAnchor.constraint(equalToConstant: 28),
				view_BulletHolderView.heightAnchor.constraint(equalToConstant: 28),
				view_BulletHolderView.centerXAnchor.constraint(equalTo: view_LineView.centerXAnchor, constant: 0),
				
				view_BulletView.widthAnchor.constraint(equalToConstant: 12),
				view_BulletView.heightAnchor.constraint(equalToConstant: 12),
				view_BulletView.centerXAnchor.constraint(equalTo: view_BulletHolderView.centerXAnchor, constant: 0),
				view_BulletView.centerYAnchor.constraint(equalTo: view_BulletHolderView.centerYAnchor, constant: 0),
			])
			
		}
		func _setupTitleLabel() {
			contentView.addSubview(label_Title_)
			
			label_Title_.setContentHuggingPriority(.init(251), for: .vertical)
			
			NSLayoutConstraint.activate([
				label_Title_.leadingAnchor.constraint(equalTo: view_LineView.leadingAnchor, constant: 24),
				label_Title_.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24),
				label_Title_.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
				view_BulletHolderView.centerYAnchor.constraint(equalTo: label_Title_.centerYAnchor, constant: 0),
			])
			
			self.label_Title = label_Title_
		}
		func _setuoDetailsLabel() {
			contentView.addSubview(label_Details_)
			
			label_Details_.setContentHuggingPriority(UILayoutPriority(250), for: .vertical)
			
			NSLayoutConstraint.activate([
				label_Details_.leadingAnchor.constraint(equalTo: view_LineView.leadingAnchor, constant: 24),
				label_Details_.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 24),
				label_Details_.topAnchor.constraint(equalTo: label_Title_.bottomAnchor, constant: 12),
				label_Details_.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
			])
			
			self.label_Details = label_Details_
		}
		
		_setupLineView()
		_setupBulletView()
		_setupTitleLabel()
		_setuoDetailsLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
}
