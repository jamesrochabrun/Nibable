//
//  ColorCell.swift
//  Nibable
//
//  Created by James Rochabrun on 10/20/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ColorCell: BaseCollectionViewCell<UIColor> {
    
    @IBOutlet weak var colorView: UIView!
    
    override var item: UIColor! {
        didSet {
            colorView.backgroundColor = .clear
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
