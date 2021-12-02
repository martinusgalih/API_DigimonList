//
//  CollectionViewCell.swift
//  API_DigimonList
//
//  Created by Martinus Galih Widananto on 02/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private var image: UIImageView = {
        var imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    private var name: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var rank: UILabel = {
        var rank = UILabel()
        rank.text = ""
        rank.textAlignment = .center
        return rank
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        contentView.addSubview(name)
        contentView.addSubview(rank)
        contentView.addSubview(image)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("hasnt implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        name.frame = CGRect(x: 5, y: contentView.frame.size.height - 60, width: contentView.frame.size.width - 10, height: 50)
        rank.frame = CGRect(x: 5, y: 85, width: contentView.frame.size.width - 10, height: 50)
        image.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 50)
    }
 
    public func configureName(label: String) {
        name.text = label
    }
    public func configureRank(label: String) {
        rank.text = label
    }
    public func configureImage(img: UIImage) {
        image.image = img
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        rank.text = nil
        image.image = nil
    }
}
