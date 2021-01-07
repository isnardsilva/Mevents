//
//  UIImageView+setImage.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    /// Permite exibir uma imagem baixada da internet (a partir de um link) no Image View
    func setImage(url: URL?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, completionHandler: { result in
            switch result {
            case .success:
                break
                
            case .failure:
                self.image = UIImage(named: Identifier.Image.defaultImage)
            }
        })
        
        
//        if url == nil {
//            self.image = UIImage(systemName: "photo")
//            self.contentMode = .scaleAspectFit
//            return
//        } else {
//            self.kf.indicatorType = .activity
//            self.kf.setImage(with: url)
//        }
    }
}
