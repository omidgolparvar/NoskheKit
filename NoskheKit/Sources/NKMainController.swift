import Foundation
import UIKit
import StoreKit

final class NKMainController: UIViewController {
	
	private var button_Dismiss		: UIButton!
	private var tableView_Changes	: UITableView!
	private var button_SubmitReview	: UIButton!
	
	private var isFirstAppear	: Bool = true
	private var viewModel		: ChangesViewModel
	
	init(viewModel: ChangesViewModel) {
		self.viewModel = viewModel
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		
		func _setupDismissButton() {
			if #available(iOS 14.0, *) {
				let configuration = UIImage.SymbolConfiguration(pointSize: 14, weight: .medium)
				let closeImage = UIImage(systemName: "xmark", withConfiguration: configuration)
				let action = UIAction(image: closeImage) { [weak self] (_) in
					self?.dismissController()
				}
				
				button_Dismiss = UIButton(primaryAction: action)
				button_Dismiss.tintColor = .systemGray
				button_Dismiss.backgroundColor = .systemGray4
			} else {
				button_Dismiss = UIButton(frame: .zero)
				button_Dismiss.setTitle("x", for: .normal)
				button_Dismiss.tintColor = .darkGray
				button_Dismiss.backgroundColor = .lightGray
				button_Dismiss.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
			}
			
			button_Dismiss.translatesAutoresizingMaskIntoConstraints = false
			button_Dismiss.layer.cornerRadius = 16
			
			view.addSubview(button_Dismiss)
			
			NSLayoutConstraint.activate([
				button_Dismiss.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
				button_Dismiss.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
				button_Dismiss.widthAnchor.constraint(equalToConstant: 33),
				button_Dismiss.heightAnchor.constraint(equalToConstant: 33),
			])
		}
		func _setupChangesTableView() {
			tableView_Changes = UITableView(frame: .zero)
			tableView_Changes.translatesAutoresizingMaskIntoConstraints = false
			tableView_Changes.allowsSelection = false
			
			view.addSubview(tableView_Changes)
			
			NSLayoutConstraint.activate([
				tableView_Changes.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
				tableView_Changes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
				tableView_Changes.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
				tableView_Changes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
			])
		}
		func _setupSubmitReviewButton() {
			if #available(iOS 14.0, *) {
				let action = UIAction(title: "__SUBMIT_REVIEW__") { [weak self] (_) in
					self?.presentSubmitReviewController()
				}
				button_SubmitReview = UIButton(primaryAction: action)
				button_SubmitReview.tintColor = .label
			} else {
				button_SubmitReview = UIButton(frame: .zero)
				button_SubmitReview.tintColor = .black
				button_SubmitReview.addTarget(self, action: #selector(presentSubmitReviewController), for: .touchUpInside)
			}
			
			button_SubmitReview.translatesAutoresizingMaskIntoConstraints = false
			button_SubmitReview.layer.cornerRadius = 10
			
			view.addSubview(button_SubmitReview)
			
			NSLayoutConstraint.activate([
				button_SubmitReview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
				button_SubmitReview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
				button_SubmitReview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
				button_SubmitReview.heightAnchor.constraint(equalToConstant: 44),
			])
		}
		func _setupGradientViews() {
			let color0: UIColor
			if #available(iOS 13, *) {
				color0 = UIColor(dynamicProvider: { (traitCollection) in
					traitCollection.userInterfaceStyle == .dark
						? .black
						: .white
				})
			} else {
				color0 = .white
			}
			let color1 = color0.withAlphaComponent(0)
			
			let gradientView_Top = GradientView(frame: .zero, startColor: color0, endColor: color1)
			let gradientView_Bottom = GradientView(frame: .zero, startColor: color1, endColor: color0)
			
			gradientView_Top.translatesAutoresizingMaskIntoConstraints = false
			gradientView_Bottom.translatesAutoresizingMaskIntoConstraints = false
			
			view.addSubview(gradientView_Top)
			view.addSubview(gradientView_Bottom)
			
			NSLayoutConstraint.activate([
				gradientView_Top.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
				gradientView_Top.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
				gradientView_Top.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
				gradientView_Top.heightAnchor.constraint(equalToConstant: 100),
				
				gradientView_Bottom.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
				gradientView_Bottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
				gradientView_Bottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
				gradientView_Bottom.heightAnchor.constraint(equalToConstant: 100),
			])
			
		}
		
		_setupChangesTableView()
		_setupGradientViews()
		_setupSubmitReviewButton()
		_setupDismissButton()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		func _setupView() {
			self.view.semanticContentAttribute = viewModel.uiConfiguration.isRightToLeft
				? .forceRightToLeft
				: .forceLeftToRight
		}
		func _setupTableView() {
			viewModel.setupTableView(tableView_Changes)
		}
		func _setupSubmitReviewButton() {
			switch viewModel.uiConfiguration.submitReviewButtonStatus {
			case .notExist:
				button_SubmitReview.isHidden = true
			case .exist(let configuration):
				button_SubmitReview.setTitle(configuration.title, for: .normal)
				button_SubmitReview.setTitleColor(configuration.textColor, for: .normal)
				button_SubmitReview.backgroundColor = configuration.backgroundColor
				button_SubmitReview.titleLabel?.font = configuration.font
			}
		}
		
		
		_setupView()
		_setupTableView()
		_setupSubmitReviewButton()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		if isFirstAppear {
			viewModel.scrollToCurrentVersion()
			isFirstAppear = false
		}
	}
	
	@objc
	private func dismissController() {
		dismiss(animated: true, completion: nil)
	}
	
	@objc
	private func presentSubmitReviewController() {
		SKStoreReviewController.requestReview()
	}
	
}


