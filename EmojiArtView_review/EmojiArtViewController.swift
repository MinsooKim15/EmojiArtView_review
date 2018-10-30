//
//  ViewController.swift
//  EmojiArtView_review
//
//  Created by minsoo kim on 30/10/2018.
//  Copyright © 2018 minsoo kim. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController, UIDropInteractionDelegate
{
    
    @IBOutlet weak var dropZone: UIView!{
        didSet{
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    
    @IBOutlet weak var emojiArtView: EmojiArtView!
    
    var emojiArtBackgroudImage : UIImage?{
        get{
            return emojiArtView.backGroundImage
        }
        set{
            emojiArtView.backGroundImage = newValue
            let size = newValue?.size ?? CGSize.zero
            emojiArtView.frame = CGRect(origin : CGPoint.zero, size: size)
        }
    }
    
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    var imageFetcher : ImageFetcher!
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        imageFetcher = ImageFetcher(){ (url, image) in
            DispatchQueue.main.async{
                self.emojiArtBackgroudImage = image
            }
        }
        session.loadObjects(ofClass: NSURL.self){nsurls in
            if let url = nsurls.first as? URL{
                self.imageFetcher.fetch(url)
            }
        }
        session.loadObjects(ofClass: UIImage.self) {images in
            if let image = images.first as? UIImage{
                self.imageFetcher.backup = image
            }
        }
        
    }
    
}

