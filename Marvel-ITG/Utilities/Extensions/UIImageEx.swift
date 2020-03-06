//
//  UIImageEx.swift
//  Marvel-ITG
//
//  Created by a7med on 3/6/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
import SDWebImage
extension UIImage{
    func saveImage(url: URL, complation: @escaping SDWebImageNoParamsBlock) {

        let manager = SDWebImageManager.shared
        if let key = manager.cacheKey(for: url) {
            
            manager.imageCache.store(self, imageData: self.pngData(), forKey: key, cacheType: .disk, completion: complation)
        }
    }
    

//imageFromMemoryCache(forKey: key)
     func imageFromMemory(for url: String) -> UIImage? {
        var image : UIImage?
        if let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encoded) {
            let manager = SDWebImageManager.shared
            if let key: String = manager.cacheKey(for: url),
                let _ = manager.imageCache.queryImage(forKey: key, options: .queryDiskDataSync, context: nil, completion: { (img, dt, ccht) in
                    image = image
                }){
            }
        }
        return image
    }
}
