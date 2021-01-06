//
//  CheckInView.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import UIKit

final class CheckInView: UIView {
    // MARK: - Views
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirmação de Check In"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.keyboardType = .alphabet
        textField.textContentType = .name
        textField.autocapitalizationType = .sentences
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm".uppercased(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        loadingView.isHidden = true
        return loadingView
    }()
    
    
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Handle Loading Mode
extension CheckInView {
    func enableLoadingMode(_ enable: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.endEditing(true)
            self?.loadingView.isHidden = !enable
        }
    }
}



// MARK: - View Codable
extension CheckInView: ViewCodable {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(confirmButton)
        addSubview(loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = UIColor(named: Identifier.Color.mainBackgroundColor)
    }
}
