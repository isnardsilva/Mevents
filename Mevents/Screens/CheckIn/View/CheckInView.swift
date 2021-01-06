//
//  CheckInView.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import UIKit

final class CheckInView: UIView {
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
extension CheckInView: ViewCodable {
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAditionalConfiguration() {
        backgroundColor = UIColor(named: Identifier.Color.mainBackgroundColor)
    }
}
