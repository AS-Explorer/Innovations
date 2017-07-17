//
//  TextCVCell.swift
//  Innovations
//
//  Created by AFSHA on 16/07/17.
//  Copyright © 2017 Afsha. All rights reserved.
//

import UIKit

class TextCVCell: UICollectionViewCell {
    
    @IBOutlet weak var lblText : UILabel!
    
    static let reuseIdentifier = "TextCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var interestLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.yellow
        label.numberOfLines = 1
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){
        contentView.layer.cornerRadius = 2.0
        contentView.clipsToBounds = true
        interestLabel.frame = CGRect.init(x: 40, y: 5, width: Int(self.contentView.bounds.width - 80), height: 25)
        contentView.addSubview(interestLabel)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.interestLabel.text = ""
//    }
    
    
}
