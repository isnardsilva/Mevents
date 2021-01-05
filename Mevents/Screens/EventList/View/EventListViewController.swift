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
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Mevent"
    }
}

