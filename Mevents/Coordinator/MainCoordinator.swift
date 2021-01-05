//
//  MainCoordinator.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

/// Implementação principal de Coordinator da aplicação utilizada para fazer o gerenciado do fluxo de todas as telas
final class MainCoordinator: Coordinator {
    // MARK: - Properties
    var navigationController: UINavigationController
    
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - Start Method
    func start() {
        let eventListVC = EventListViewController()
        eventListVC.coordinator = self
        navigationController.pushViewController(eventListVC, animated: true)
    }
}
