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
    
    private var userInfo: User?
    
    
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
        setupUserData()
    }
}

// MARK: - Handle User Data
extension CheckInViewController {
    private func setupUserData() {
        guard let user = try? UserDAO().getUser() else {
            return
        }
        
        baseView.nameTextField.text = user.name
        baseView.emailTextField.text = user.email
        self.userInfo = user
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
            
            // Save new user infos
            if var existingUser = userInfo {
                existingUser.name = typedName
                existingUser.name = typedEmail
                try? UserDAO().saveUser(user: existingUser)
            } else {
                let newUserInfo = User(name: typedName, email: typedEmail)
                try? UserDAO().saveUser(user: newUserInfo)
                self.userInfo = newUserInfo
            }
            
            self.confirmCheckIn()
        } catch {
            showAlert(title: "Opa", message: error.localizedDescription)
        }
    }
}


// MARK: Confirm Check In
extension CheckInViewController {
    private func confirmCheckIn() {
        baseView.enableLoadingMode(true)
        viewModel.checkIn(completionHandler: { [weak self] error in
            self?.baseView.enableLoadingMode(false)
            
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
