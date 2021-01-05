//
//  EventListView.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventListView: UIView {
    // MARK: - Views
    
    
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
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = .systemBackground
    }
}
