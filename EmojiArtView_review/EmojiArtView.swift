//
//  EmojiArtView.swift
//  EmojiArtView_review
//
//  Created by minsoo kim on 30/10/2018.
//  Copyright © 2018 minsoo kim. All rights reserved.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {

    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup(){
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    var backGroundImage: UIImage? {didSet{setNeedsDisplay()}}
    override func draw(_ rect: CGRect){
        backGroundImage?.draw(in: bounds)
    }
}
