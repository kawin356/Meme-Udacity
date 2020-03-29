//
//  Attributed.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 24/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation
import UIKit

let paragraph = NSMutableParagraphStyle()

func getParagraph() -> NSMutableParagraphStyle {
    paragraph.alignment = .center
    return paragraph
}

var memeTextAttributes: [NSAttributedString.Key: Any] = [
    NSAttributedString.Key.strokeColor: UIColor.black,
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.font: UIFont(name: K.Font.defaultFont, size: K.Font.defaultSize)!,
    NSAttributedString.Key.strokeWidth:  -3,
    NSAttributedString.Key.paragraphStyle: getParagraph()
]
