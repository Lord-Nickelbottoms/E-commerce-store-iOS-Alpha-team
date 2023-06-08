//
//  MenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 139 on 2023/06/08.
//

import UIKit

class menViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var searchProduct = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //self.collectionView.reloadData()
        searchProduct = items
    }
    
}
extension menViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenCollectionViewCell", for: indexPath) as! MenCollectionViewCell
        cell.setup(with: searchProduct[indexPath.row])
        
        //cell.ProductNameLbl.text = items
        cell.reloadInputViews()
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
        
        //cell.titleTextLabel.text = articleVM.title
        //cell.descriptionTextLabel.text = articleVM.description
    }
}

extension menViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 260)
    }
}

extension menViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = []
        if searchText == ""
        {
            searchProduct = items
        }
        for word in items{
            if word.name.lowercased().contains(searchText.lowercased())
            {
                searchProduct.append(word)
                self.collectionView.reloadData()
            }
        }
        self.collectionView.reloadData()
        //self.collectionView.reloadSections(IndexSet(integer: 0))
    }
}

extension menViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row].category)
    }
}
