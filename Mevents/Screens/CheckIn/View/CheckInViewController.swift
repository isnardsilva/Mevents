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
    private let viewModel = CheckInViewModel()
    
    
    // MARK: - Initialization
    init(event: Event) {
        super.init(nibName: nil, bundle: nil)
        viewModel.setEventId(event.id)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        self.view = baseView
        
        setupActions()
    }
}


// MARK: - Actions
extension CheckInViewController {
    private func setupActions() {
        baseView.confirmButton.addTarget(self, action: #selector(confirmButtonTouched(_:)), for: .touchUpInside)
    }
    
    @objc private func confirmButtonTouched(_ sender: UIButton) {
        let typedName = baseView.nameTextField.text ?? ""
        let typedEmail = baseView.emailTextField.text ?? ""
        
        do {
            try viewModel.setUserName(typedName)
            try viewModel.setUserEmail(typedEmail)
            self.confirmCheckIn()
        } catch {
            showAlert(title: "Opa", message: error.localizedDescription)
        }
    }
}


// MARK: Confirm Check In
extension CheckInViewController {
    private func confirmCheckIn() {
        viewModel.checkIn(completionHandler: { [weak self] error in
            if let detectedError = error {
                self?.showAlert(title: "Opa", message: detectedError.localizedDescription)
            }
        })
    }
}


// MARK: - UIAlerts
extension CheckInViewController {
    private func showAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
