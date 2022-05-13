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
    
    lazy var stackView: UIStackView = {
        let c = UIStackView(arrangedSubviews: [imageView, nameLabel])
        c.axis = .vertical
        c.spacing = 5
        c.distribution = .fill
        return c
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.textAlignment = .center
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.numberOfLines = 0
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stackView)

        stackView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: String, label: String){
        self.nameLabel.text = label
        self.imageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: label))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        imageView.image = nil
    }
    
}
