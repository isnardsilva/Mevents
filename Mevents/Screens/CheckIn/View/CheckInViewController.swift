//
//  CheckInViewController.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import UIKit

final class CheckInViewController: UIViewController {
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    private lazy var baseView = CheckInView()
    
    
    // MARK: - Initialization
    init(event: Event) {
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
}
