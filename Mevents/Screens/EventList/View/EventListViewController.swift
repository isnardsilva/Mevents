//
//  EventListViewController.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventListViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    
    private lazy var baseView = EventListView()
    private lazy var viewModel: EventListViewModel = {
        let viewModel = EventListViewModel()
        
        viewModel.didReceiveEvents = { [weak self] in
            self?.didReceiveEvents()
        }
        
        viewModel.didReceiveError = { [weak self] error in
            self?.didReceiveError(error)
        }
        
        return viewModel
    }()
    
    private var dataSource: EventListDataSource? {
        didSet {
            guard let validDataSource = dataSource else { return }
            
            validDataSource.didSelectEvent = { [weak self] event in
                self?.didSelectEvent(event)
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.baseView.collectionView.dataSource = validDataSource
                self?.baseView.collectionView.delegate = validDataSource
                self?.baseView.collectionView.reloadData()
                self?.baseView.changeContentMode(to: .contentDisplay)
            }
        }
    }
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Mevent"
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        viewModel.fetchEvents()
    }
}


// MARK: - Handle View Model Responses
extension EventListViewController {
    private func didReceiveEvents() {
        dataSource = EventListDataSource(events: viewModel.events)
    }
    
    private func didReceiveError(_ error: Error) {
        baseView.changeContentMode(to: .error(message: error.localizedDescription))
    }
}


// MARK: - Handle Event Selection
extension EventListViewController {
    private func didSelectEvent(_ event: Event) {
//        print("Selected event:", event.title)
        coordinator?.navigateToEventDetail(event: event)
    }
}
