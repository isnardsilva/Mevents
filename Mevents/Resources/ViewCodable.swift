//
//  ViewCodable.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

protocol ViewCodable {
    func setupViews()
    func setupHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}


// MARK: - Helper Implementation Method
extension ViewCodable {
    func setupViews() {
        setupHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
}
