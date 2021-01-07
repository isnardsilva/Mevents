//
//  SharingView.swift
//  Mevents
//
//  Created by Isnard Silva on 07/01/21.
//

import UIKit

class SharingView: UIActivity {
    // MARK: - Properties
    var title: String
    var message: String
    var image: UIImage?
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    
    override var activityTitle: String? {
        return title
    }
    
    override var activityImage: UIImage? {
        return image
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: "com.yoursite.yourapp.activity")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    
    // MARK: - Initialization
    init(title: String, message: String, image: UIImage?, performAction: @escaping ([Any]) -> Void) {
        self.title = title
        self.message = message
        self.image = image
        self.action = performAction
        super.init()
    }
    
    
    // MARK: - Setup Methods
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }
}
