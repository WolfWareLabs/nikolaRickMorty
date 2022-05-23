//
//  ViewController.swift
//  test1
//
//  Created by Nikola Blagoevski on 30.3.22.
//

import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ViewModelDelegate {
    
    var viewModel = ViewModel()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CellForCharacter = collectionView.dequeueReusableCell(withReuseIdentifier: CellForCharacter.identifier, for: indexPath) as? CellForCharacter ?? CellForCharacter()
        
        cell.configure(image: viewModel.characters[indexPath.item].image, label: viewModel.characters[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewController = CellViewController(person: viewModel.characters[indexPath.item])
        cellViewController.title = viewModel.characters[indexPath.item].name
        navigationController?.pushViewController(cellViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY > contentHeight - scrollView.frame.size.height {
                guard !viewModel.isLoading else {
                    return
                }
                viewModel.loadData()
            }
    }
    
    func reload() { 
        collectionView.reloadData()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 3, height: (view.frame.size.width/3) - 3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(CellForCharacter.self, forCellWithReuseIdentifier: CellForCharacter.identifier)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.loadData()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            make in make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.delegate = self
    }

}

