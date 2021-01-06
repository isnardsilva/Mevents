//
//  EventDetailViewController.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventDetailViewController: UIViewController {
    // MARK: - Properties
    private lazy var baseView = EventDetailView()
    private let viewModel: EventViewModel
    weak var coordinator: MainCoordinator?
    
    
    // MARK: - Initialization
    init(event: Event) {
        self.viewModel = EventViewModel(event: event)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
        setupEventData()
    }
}


// MARK: Setup Event Data
extension EventDetailViewController {
    private func setupEventData() {
        baseView.imageView.setImage(url: URL(string: viewModel.image))
        baseView.titleLabel.text = viewModel.title
        baseView.descriptionLabel.text = viewModel.description
        baseView.dateLabel.text = viewModel.formattedDate
        baseView.priceLabel.text = viewModel.formattedPrice
    }
}


// MARK: - Actions
extension EventDetailViewController {
    private func setupActions() {
        baseView.checkInButton.addTarget(self, action: #selector(checkInButtonTouched(_:)), for: .touchUpInside)
    }
    
    @objc private func checkInButtonTouched(_ sender: UIButton) {
        coordinator?.navigateToCheckIn(event: viewModel.event)
    }
}
