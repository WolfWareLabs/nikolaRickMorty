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
        self.backgroundColor = .white
        self.font = .systemFont(ofSize: 20)
        self.textAlignment = .left
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //makeStackView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.addSubview(stackView)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        makeStackConstraint()
        view.addSubview(scrollView)
    }
    
    lazy var stackView: UIStackView = {
        let tmp = UIStackView(arrangedSubviews: [image, label1, label2, label3, label4, label5, label6, label7])
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
            make in make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
    lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.sd_setImage(with: URL(string: person.image))
        return temp
    }()
    
    lazy var label1: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.status
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Status: " + txt
        return tmp
    }()
    
    lazy var label2: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.species
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Species: " + txt
        return tmp
    }()
    
    lazy var label3: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.type
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Type: " + txt
        return tmp
    }()
    
    lazy var label4: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.gender
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Gender: " + txt
        return tmp
    }()
    
    lazy var label5: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.origin.name
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Origin: " + txt
        return tmp
    }()
    
    lazy var label6: NikolaAwesomeLabel = {
        let tmp = NikolaAwesomeLabel()
        var txt = person.location.name
        if txt.count < 1 {
            txt = "unknown"
        }
        tmp.text = "Location: " + txt
        return tmp
    }()
    
    lazy var label7: NikolaAwesomeLabel = {
        var tmp = NikolaAwesomeLabel()
        if person.episode.count < 1{
            tmp.text = "none"
            return tmp
        }
        tmp.text = "Episodes:\n"
        for str in self.person.episode {
            tmp.text! += str + "\n"//zasho me tera da forciram ovde so !
        }
        return tmp
    }()
    
  
    
}
