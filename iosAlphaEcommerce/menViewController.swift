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
    @IBAction func btnPants(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Pants"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnShirts(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Shirts"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    
    @IBAction func btnTshirts(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Tshirts"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnJackets(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Jackets"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnAll(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Pants" || word.category == "Jackets" || word.category == "Shirts" || word.category == "Shorts" || word.category == "TShirts"
            {
                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
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
        
        let vc = storyboard?.instantiateViewController(identifier: "SingleViewController") as? SingleViewController
        //    let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
//        let defaults = UserDefaults.standard
//
//        defaults.set(count, forKey: "Countt")
        
        vc?.name = searchProduct[indexPath.row].name
        vc?.category = searchProduct[indexPath.row].category
        vc?.colour = searchProduct[indexPath.row].colour
        vc?.price = searchProduct[indexPath.row].price
        vc?.gender = searchProduct[indexPath.row].gender
        vc?.imgname = searchProduct[indexPath.row].image
        vc?.size = searchProduct[indexPath.row].size
//        vc?.count = count
            self.navigationController?.pushViewController(vc!, animated: true)
        
        print(items[indexPath.row].category)
    }
}

