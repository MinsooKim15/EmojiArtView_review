//
//  EmojiArtView.swift
//  EmojiArtView_review
//
//  Created by minsoo kim on 30/10/2018.
//  Copyright © 2018 minsoo kim. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    
    var backGroundImage: UIImage? {didSet{setNeedsDisplay()}}
    override func draw(_ rect: CGRect){
        backGroundImage?.draw(in: bounds)
    }
}
