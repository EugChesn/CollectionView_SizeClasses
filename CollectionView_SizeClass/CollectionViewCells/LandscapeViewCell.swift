//
//  LandscapeViewCell.swift
//  CollectionView_SizeClass
//
//  Created by EvgeniiChistyakov on 21.03.2021.
//

import UIKit

class LandscapeViewCell: UICollectionViewCell {
    
    static let reuseIndetifier = "LandscapeViewCell"
    
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = #colorLiteral(red: 0.9194578528, green: 0.8730059862, blue: 0.8861635327, alpha: 1)
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
    }
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
    
}
