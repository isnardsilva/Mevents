//
//  EventDetailView.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventDetailView: UIView {
    // MARK: - Views
    
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: View Codable
extension EventDetailView: ViewCodable {
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = UIColor(named: Identifier.Color.mainBackgroundColor)
    }
}
