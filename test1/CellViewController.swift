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

class CellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var person: CharacterModel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.episode.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Episodes:"
        label.textAlignment = .center

        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(label)

        label.snp.makeConstraints{make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }

        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character",for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = person.episode[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    lazy var tableView: UITableView = {
        let c = UITableView()
        return c
    }()
    
    lazy var header: UIView = {
        let c = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 450))
        c.backgroundColor = .white
        return c
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image, statusLabel, speciesLabel, typeLabel,
                                                  genderLabel, originLabel, locationLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.alignment = .center
    
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "character")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(person: CharacterModel){
        self.person = person
        super.init(nibName: nil, bundle: nil)
        
        header.addSubview(stackView)
        tableView.tableHeaderView = header
        
        stackView.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    lazy var statusLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.status.isEmpty {
            c.text = "Status: unknown"
            return c
        }
        c.text = "Status: " + person.status
        return c
    }()
    
    lazy var speciesLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.species.isEmpty {
            c.text = "Species: unknown"
            return c
        }
        c.text = "Species: " + person.species
        return c
    }()
    
    lazy var typeLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.type.isEmpty {
            c.text = "Type: unknown"
            return c
        }
        c.text = "Type: " + person.type
        return c
    }()
    
    lazy var genderLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.gender.isEmpty {
            c.text = "Gender: unknown"
            return c
        }
        c.text = "Gender: " + person.gender
        return c
    }()
    
    lazy var originLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.origin.name.isEmpty {
            c.text = "Origin: unknown"
            return c
        }
        c.text = "Origin: " + person.origin.name
        return c
    }()
    
    lazy var locationLabel: NikolaAwesomeLabel = {
        let c = NikolaAwesomeLabel()
        if person.location.name.isEmpty {
            c.text = "Location: unknown"
            return c
        }
        c.text = "Location: " + person.location.name
        return c
    }()
    
    //this is the image that is in the header of the table
    lazy var image: UIImageView = {
        let c = UIImageView()//must have this argument
        c.sd_setImage(with: URL(string: self.person.image))
        c.snp.makeConstraints{
            make in
            make.width.height.equalTo(200)
        }
        c.contentMode = .scaleAspectFit
        return c
    }()
}
