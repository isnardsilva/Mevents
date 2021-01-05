//
//  EventListViewController.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventListViewController: UIViewController {
    // MARK: - Properties
    private lazy var baseView = EventListView()
    weak var coordinator: MainCoordinator?
    
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
            }
        }
    }
    
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Mevent"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        dataSource = EventListDataSource(events: [])
    }
}


// MARK: - Handle Event Selection
extension EventListViewController {
    private func didSelectEvent(_ event: Event) {
        print("Selected")
    }
}
