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

let memeTextAttributes: [NSAttributedString.Key: Any] = [
    NSAttributedString.Key.strokeColor: UIColor.black/* TODO: fill in appropriate UIColor */,
    NSAttributedString.Key.foregroundColor: UIColor.white/* TODO: fill in appropriate UIColor */,
    NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
    NSAttributedString.Key.strokeWidth:  -3, /* TODO: fill in appropriate Float */
    NSAttributedString.Key.paragraphStyle: getParagraph()
]
