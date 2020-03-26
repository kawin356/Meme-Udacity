//
//  KeyboardCheckController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 26/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func checkKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardScreenUp(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardScreenDown(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeCheckKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardScreenUp(_ notification: Notification) {
        if bottomTextField.isHighlighted {
            view.frame.origin.y -= getKeyboardHigh(notification)
        }
    }
    
    @objc func keyboardScreenDown(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHigh(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        return keyboardSize.height
    }
}
