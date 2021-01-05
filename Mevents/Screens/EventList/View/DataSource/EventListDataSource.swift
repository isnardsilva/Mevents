//
//  EventListDataSource.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit

final class EventListDataSource: NSObject {
    // MARK: - Properties
    private let events: [Event]
    
    var didSelectEvent: ((Event) -> Void)?
    
    
    // MARK: - Initialization
    init(events: [Event]) {
        self.events = events
    }
}


// MARK: - UICollectionViewDataSource
extension EventListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Cell.eventCell, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension EventListDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedEvent = events[indexPath.row]
        self.didSelectEvent?(selectedEvent)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension EventListDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftSectionInsets: CGFloat = 20
        let rightSectionInsets: CGFloat = 20
        
        let paddingSpace = leftSectionInsets + rightSectionInsets
        let availableWidth = collectionView.frame.width - paddingSpace
        
        return CGSize(width: availableWidth, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 20, bottom: 0, right: 20)
    }
}
