//
//  EventListView.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventListView: UIView {
    // MARK: - Views
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .clear
        collectionView.isHidden = true
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: Identifier.Cell.eventCell)
        return collectionView
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Ocorreu um erro..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Properties
    enum EventListContentMode {
        case contentDisplay
        case error(message: String)
        case loading
    }
    
    
    
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


// MARK: - Handle Content Mode
extension EventListView {
    func changeContentMode(to contentMode: EventListContentMode) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch contentMode {
            case .contentDisplay:
                self.errorLabel.isHidden = true
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
                self.collectionView.isHidden = false
                
            case .error(let message):
                self.errorLabel.isHidden = false
                self.errorLabel.text = message
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
                self.collectionView.isHidden = true
                
            case .loading:
                self.errorLabel.isHidden = true
                self.activityIndicatorView.isHidden = false
                self.activityIndicatorView.startAnimating()
                self.collectionView.isHidden = true
            }
        }
    }
}


// MARK: - View Codable
extension EventListView: ViewCodable {
    func setupHierarchy() {
        addSubview(collectionView)
        addSubview(errorLabel)
        addSubview(activityIndicatorView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = UIColor(named: Identifier.Color.mainBackgroundColor)
        activityIndicatorView.startAnimating()
    }
}
