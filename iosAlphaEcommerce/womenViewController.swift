//
//  womenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenViewController: UIViewController {
var count = 0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var searchProduct = [Item1]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        searchProduct = items1
    }
    @IBAction func btnAll(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Pants" || word.category == "Jackets" || word.category == "" || word.category == "Dresses" || word.category == "Shirts"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
   
    @IBAction func btnJackets(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Jackets"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
        
    }
    @IBAction func btnShirts(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Shirts"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
        
    }
    @IBAction func btnDresses(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Dresses"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
        
    }
    @IBAction func btnPants(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Pants"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
}
extension womenViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "womenCollectionViewCell", for: indexPath) as! womenCollectionViewCell
        cell.setup1(with: searchProduct[indexPath.row])
        
        //cell.ProductNameLbl.text = items
        cell.reloadInputViews()
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
        
        //cell.titleTextLabel.text = articleVM.title
        //cell.descriptionTextLabel.text = articleVM.description
    }
}

extension womenViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 260)
    }
}

extension womenViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = []
        if searchText == ""
        {
            searchProduct = items1
        }
        for word in items1{
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

extension womenViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.row].category)
    }
}


