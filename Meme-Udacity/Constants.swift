//
//  Constants.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 28/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation
import UIKit

struct K {
    struct Cell {
        static let reuseTableViewCell = "MemeTableCell"
        static let reuseCollectionViewCell = "MemeCollectionCell"
    }
    
    struct StoryBoard {
        static let showMemeViewController = "ShowMemeViewController"
        static let editMemeViewController = "EditMemeViewController"
    }
    
    struct Segue {
        static let fontViewController = "FontViewPage"
    }
    
    struct DefaultText {
        static let resetTopText = "TOP"
        static let resetBottomText = "BOTTOM"
    }
    
    struct Font {
        static let defaultFont = "HelveticaNeue-CondensedBlack"
        static let defaultSize: CGFloat = 40
    }
    
}
