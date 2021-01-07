//
//  LoadingView.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import UIKit

class LoadingView: UIView {
    // MARK: - Views
    // MARK: - Views
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.alpha = 0.5
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    // MARK: - Properties
    override var isHidden: Bool {
        didSet {
            if isHidden {
                activityIndicatorView.stopAnimating()
            } else {
                activityIndicatorView.startAnimating()
            }
        }
    }
    
    
    // MARK: - Initialization
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - View Codable
extension LoadingView: ViewCodable {
    func setupHierarchy() {
        addSubview(blurView)
        addSubview(activityIndicatorView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = .clear
    }
}
