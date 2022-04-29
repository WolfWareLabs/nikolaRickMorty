//
//  CellForCharacter.swift
//  test1
//
//  Created by Nikola Blagoevski on 18.4.22.
//

import Foundation
import UIKit
import SDWebImage

class CellForCharacter: UICollectionViewCell{
        
    static let identifier = "CellForCharacter"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        //image.backgroundColor = .yellow
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let label: UILabel = {
        let myLabel = UILabel()
        myLabel.text = "This is some text"
        //myLabel.backgroundColor = .green
        myLabel.textAlignment = .center
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.numberOfLines = 0
        //myLabel.adjustsFontSizeToFitWidth = true
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .systemRed
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 5,
                             y: contentView.frame.size.height-50,
                             width: contentView.frame.size.width-10,
                             height: 50)
        imageView.frame = CGRect(x: 5,
                             y: 0,
                             width: contentView.frame.size.width-10,
                             height: contentView.frame.size.height-50)
    }
    
    public func configure(image: String, label: String){
        self.label.text = label
        self.imageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: label))
    
        //self.imageView.image = UIImage(systemName: "house")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageView.image = nil
    }
    
}
