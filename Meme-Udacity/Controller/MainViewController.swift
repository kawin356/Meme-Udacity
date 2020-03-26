//
//  ViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 24/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toolbarPhoto: UIToolbar!
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
   
    let pickImage = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickImage.delegate = self
        topTextField.delegate = self
        bottomTextField.delegate = self
        setupUI()
        showLabel(isDisable: true)
    }
    
    func setupUI() {
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.backgroundColor = .clear
        bottomTextField.backgroundColor = .clear
    }
    
    func showLabel(isDisable: Bool) {
        topTextField.isHidden = isDisable
        bottomTextField.isHidden = isDisable
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        checkKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeCheckKeyboard()
        
    }
    
    @IBAction func addPhotoBarButton(_ sender: UIBarButtonItem) {
        pickImage.sourceType = .photoLibrary
        self.present(pickImage, animated: true) {
        }
    }
    
    @IBAction func cameraBarButton(_ sender: Any) {
        pickImage.sourceType = .camera
        self.present(pickImage, animated: true) {
        }
    }

    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        memeImageView.image = UIImage()
        showLabel(isDisable: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

//MARK: - ImagePickerDelegate

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            showLabel(isDisable: false)
            memeImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


//MARK: - UIActivity To Save Meme
extension MainViewController {

    @IBAction func activityButtonPressed(_ sender: Any) {
        let image = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.completionWithItemsHandler = { activity, completed, items, error in
            if completed {
                self.saveMeme()
            }
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func saveMeme() {
        // use next ep
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, originalImage: memeImageView.image!, memeImage: generateMemedImage())
        
    }

    func generateMemedImage() -> UIImage {

        // Hide toolbar and navbar
        toolbarPhoto.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)

        // Render view to an image
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let memeImage = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }

        // Show toolbar and navbar
        toolbarPhoto.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)

        return memeImage
    }
}
