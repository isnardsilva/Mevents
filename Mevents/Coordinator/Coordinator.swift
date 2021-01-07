//
//  Coordinator.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit


/// Protocolo que determina o que uma implementação de Coordinator deve fazer
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
