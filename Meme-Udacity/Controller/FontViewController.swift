//
//  FontViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 26/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class FontViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let allFontNames: [String] = {
        var fontNames = [String]()
        UIFont.familyNames.sorted().forEach { familyName in
            UIFont.fontNames(forFamilyName: familyName).sorted().forEach { fontName in
                fontNames.append(fontName)
            }
        }
        return fontNames
    }()
    
    let sizeFont: [Int] = Array(8...60)
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return allFontNames.count
        } else {
            return sizeFont.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return allFontNames[row]
        } else {
            return String(sizeFont[row])
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
