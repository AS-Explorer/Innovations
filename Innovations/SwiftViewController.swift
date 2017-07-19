//
//  SwiftViewController.swift
//  Innovations
//
//  Created by AFSHA on 16/07/17.
//  Copyright © 2017 Afsha. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var textField : UITextField!

    var items : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TextCVCell.self, forCellWithReuseIdentifier: TextCVCell.reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTapped(_ sender : Any){
        if let newText = textField.text{
            items.insert(newText, at: 0)
            textField.text = ""
            collectionView.reloadData()
        }
    }
    
}


extension SwiftViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCVCell.reuseIdentifier, for: indexPath) as? TextCVCell{ //else { fatalError() }
        cell.interestLabel.text = items[indexPath.row]
        return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
}
