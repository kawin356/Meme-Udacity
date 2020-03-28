//
//  MemeTableViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 28/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(memes.count)
        return memes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.reuseTableViewCell, for: indexPath)
        let textTop = memes[indexPath.row].topText
        let textBottom = memes[indexPath.row].bottomText
        cell.textLabel!.text = "\(textTop) ... \(textBottom)"
        cell.imageView?.image = memes[indexPath.row].originalImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editMemeVC = storyboard?.instantiateViewController(withIdentifier: K.StoryBoard.editMemeViewController) as! AddMemeViewController
        
        editMemeVC.selectMemetoEdit = indexPath.row
        editMemeVC.isSelectedMemeToEdit = true
        
        navigationController?.pushViewController(editMemeVC, animated: true)
    }
    
}
