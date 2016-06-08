//
//  ImageHelper.swift
//  Marvel Challenge
//
//  Created by Guilherme Assis on 11/03/16.
//  Copyright © 2016 Guilherme Assis. All rights reserved.
//

import UIKit
import Kingfisher

public typealias ImageLoadCompletionBlock = (image: UIImage?) -> Void

class ImageHelper: NSObject {
    
    class func loadImageWithUrl(nsurl: NSURL?, completion: ImageLoadCompletionBlock) {
        guard let url = nsurl else {
            return
        }
        
        let downloader = KingfisherManager.sharedManager.downloader
        let myCache = ImageCache(name: url.absoluteString)
        
        let optionInfo: KingfisherOptionsInfo = [
            .TargetCache(myCache),
            .Transition(ImageTransition.Fade(1))
        ]
        
        downloader.downloadImageWithURL(url, options: optionInfo, progressBlock: nil) { (image, error, imageURL, originalData) -> () in
            completion(image: image)
        }
    }
}

extension UIImageView {
    func loadImageWithUrl(url: String, placeholder: UIImage?) {
        if let _placeholder = placeholder {
            self.image = _placeholder
        }
        
        ImageHelper.loadImageWithUrl(NSURL(string: url)) { (image) -> Void in
            self.image = image
        }
    }
}
