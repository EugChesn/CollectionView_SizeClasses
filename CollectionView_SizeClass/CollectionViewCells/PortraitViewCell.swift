//
//  PortraitViewCell.swift
//  CollectionView_SizeClass
//
//  Created by EvgeniiChistyakov on 21.03.2021.
//

import UIKit

class PortraitViewCell: UICollectionViewCell {
    
    static let reuseIndetifier = "PortraitViewCell"
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = #colorLiteral(red: 0.9194578528, green: 0.8730059862, blue: 0.8861635327, alpha: 1)
        layer.cornerRadius = 8
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageView.image = nil
    }
    
    func configure(text: String?, image: UIImage?) {
        imageView.image = image
        label.text = text
    }

}
