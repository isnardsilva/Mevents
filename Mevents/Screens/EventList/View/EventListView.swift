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
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: Identifier.Cell.eventCell)
        return collectionView
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


// MARK: - View Codable
extension EventListView: ViewCodable {
    func setupHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = UIColor(named: Identifier.Color.mainBackgroundColor)
    }
}
