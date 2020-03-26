//
//  FontViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 26/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class FontViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var testTopTextField: UITextField!
    @IBOutlet weak var testBottomTextField: UITextField!
    
    @IBOutlet weak var fontPickerView: UIPickerView!
    
    var textTopFromMain: String = ""
    var textBottomFromMain: String = ""
    
    let allFontNames: [String] = {
        var fontNames = [String]()
        UIFont.familyNames.sorted().forEach { familyName in
            UIFont.fontNames(forFamilyName: familyName).sorted().forEach { fontName in
                fontNames.append(fontName)
            }
        }
        return fontNames
    }()
    
    let sizeFont: [Int] = Array(8...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentFont: UIFont = memeTextAttributes[NSAttributedString.Key.font] as! UIFont
        let fontPosition = allFontNames.firstIndex(of: currentFont.fontName)!
        let sizePosition = sizeFont.firstIndex(of: Int(Float(currentFont.pointSize)))!
        print(currentFont.pointSize)
        fontPickerView.selectRow(fontPosition, inComponent:0, animated:true)
        fontPickerView.selectRow(sizePosition, inComponent:1, animated:true)
        testTopTextField.defaultTextAttributes = memeTextAttributes
        
        testTopTextField.text = textTopFromMain
        testBottomTextField.text = textBottomFromMain
    }

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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fontName = allFontNames[pickerView.selectedRow(inComponent: 0)]
        let size = sizeFont[pickerView.selectedRow(inComponent: 1)]
        memeTextAttributes[NSAttributedString.Key.font] = UIFont(name: fontName, size: CGFloat(size))
        testTopTextField.defaultTextAttributes = memeTextAttributes
    }


    
    
    
}
