//
//  AddMemeViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 24/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class AddMemeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var toolbarPhoto: UIToolbar!
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var fontChangeButton: UIBarButtonItem!
    @IBOutlet weak var sharedButton: UIBarButtonItem!
    
    let pickImage = UIImagePickerController()
    
    var memes: [Meme]! {
          let object = UIApplication.shared.delegate
          let appDelegate = object as! AppDelegate
          return appDelegate.memes
      }
    
    var isSelectedMemeToEdit: Bool = false
    var selectMemetoEdit: Int!
    
    //MARK: - App LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickImage.delegate = self
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        showLabel(isDisable: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        checkKeyboard()
        setupUI()
        checkEditImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeCheckKeyboard()
        
    }
    
    func checkEditImage() {
        if isSelectedMemeToEdit {
            topTextField.text = memes[selectMemetoEdit].topText
            bottomTextField.text = memes[selectMemetoEdit].bottomText
            memeImageView.image = memes[selectMemetoEdit].originalImage
            showLabel(isDisable: false)
        }
    }
    
    //MARK: - Setup UI
    
    func setupUI() {
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
        topTextField.backgroundColor = .clear
        bottomTextField.backgroundColor = .clear
    }
    
    func showLabel(isDisable: Bool) {
        topTextField.isHidden = isDisable
        bottomTextField.isHidden = isDisable
        resetButton.isEnabled = !isDisable
        fontChangeButton.isEnabled = !isDisable
        sharedButton.isEnabled = !isDisable
    }
    
    
    //MARK: - IBAction
    
    @IBAction func addPhotoBarButton(_ sender: UIBarButtonItem) {
        pickImage.sourceType = .photoLibrary
        self.present(pickImage, animated: true, completion: nil)
    }
    
    @IBAction func cameraBarButton(_ sender: Any) {
        pickImage.sourceType = .camera
        self.present(pickImage, animated: true, completion: nil)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        memeImageView.image = UIImage()
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        showLabel(isDisable: true)
    }
    
    //MARK: - TextfieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FontViewPage" {
            let fontViewController = segue.destination as! FontViewController
            fontViewController.textTopFromMain = topTextField.text ?? "TOP"
            fontViewController.textBottomFromMain = bottomTextField.text ?? "BOTTOM"
        }
    }
}

//MARK: - ImagePickerDelegate

extension AddMemeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
extension AddMemeViewController {
    
    @IBAction func activityButtonPressed(_ sender: Any) {
        let image = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.completionWithItemsHandler = { activity, completed, items, error in
            if completed {
                self.saveMeme()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func saveMeme() {
        // use next ep
        let meme = Meme(topText: topTextField.text ?? "",
                     bottomText: bottomTextField.text ?? "",
                     originalImage: memeImageView.image ?? UIImage(),
                     memeImage: generateMemedImage())
        
        // Add it to the memes array in the Application Delegate
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           appDelegate.memes.append(meme)
        print(appDelegate.memes.count)
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
