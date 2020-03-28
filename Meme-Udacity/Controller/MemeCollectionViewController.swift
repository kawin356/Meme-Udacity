//
//  MemeCollectionViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 28/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let space = CGFloat(1.0)
        // let dimension = (view.frame.width - (2 * space)) / 4
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: 200, height: 100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Cell.reuseCollectionViewCell, for: indexPath) as! MemeCollectionViewCell
        cell.memeImageView.image = memes[indexPath.row].memeImage
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editMemeVC = storyboard?.instantiateViewController(withIdentifier: K.StoryBoard.editMemeViewController) as! AddMemeViewController
        
        editMemeVC.selectMemetoEdit = indexPath.row
        editMemeVC.isSelectedMemeToEdit = true
        
        navigationController?.pushViewController(editMemeVC, animated: true)
    }
    
}
