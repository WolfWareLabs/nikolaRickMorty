//
//  CellViewController.swift
//  test1
//
//  Created by Nikola Blagoevski on 22.4.22.
//

import UIKit
import SnapKit
import SDWebImage

class NikolaAwesomeLabel: UILabel{
    override init(frame: CGRect){
        super.init(frame: frame)
        self.font = .systemFont(ofSize: 20)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CellViewController: UIViewController{

    var person: CharacterModel
    
    init(person: CharacterModel){
        self.person = person
        super.init(nibName: nil, bundle: nil)
        makeStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.sd_setImage(with: URL(string: person.image))
        return temp
    }()
    
    lazy var statusLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.status
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Status: " + txt
        return tmp
    }()
    
    lazy var speciesLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.species
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Species: " + txt
        return tmp
    }()
    
    lazy var typeLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.type
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Type: " + txt
        return tmp
    }()
    
    lazy var genderLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.gender
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Gender: " + txt
        return tmp
    }()
    
    lazy var originLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.origin.name
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Origin: " + txt
        return tmp
    }()
    
    lazy var locationLabel: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.location.name
        if txt.isEmpty {
            txt = "unknown"
        }
        tmp.text = "Location: " + txt
        return tmp
    }()
    
    lazy var episodeLabel: NikolaAwesomeLabel = {
        var tmp = NikolaAwesomeLabel()
        if person.episode.isEmpty {
            tmp.text = "none"
            return tmp
        }
        tmp.text = "Episodes:\n"
        for str in self.person.episode {
            tmp.text! += str + "\n"
        }
        return tmp
    }()
    
    lazy var stackView: UIStackView = {
        let tmp = UIStackView(arrangedSubviews: [image, statusLabel, speciesLabel, typeLabel, genderLabel, originLabel, locationLabel, episodeLabel])
        tmp.axis = .vertical
        tmp.distribution = .fill
        tmp.spacing = 20
        return tmp
    }()
    
    func makeStackView(){
        view.addSubview(stackView)
        makeStackConstraint()
    }
    
    func makeStackConstraint(){
        stackView.snp.makeConstraints {
            make in make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }
    
}
