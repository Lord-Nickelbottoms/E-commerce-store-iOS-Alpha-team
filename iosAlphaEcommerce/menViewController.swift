//
//  MenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 139 on 2023/06/08.
//

import UIKit

class menViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var item = [Products]()
    
    var searchProduct = [Products]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        //self.collectionView.reloadData()
//        searchProduct = product
        
        fetchApiData { [self] in
            print("Success: Men Controller")
            searchProduct = item
            collectionView.reloadData()
        }
        
    }
    
    
    func fetchApiData(completed: @escaping() -> ()){
        let url = URL(string: "https://fakestoreapi.com/products/category/men's%20clothing")
        URLSession.shared.dataTask(with: url!) {data, result, error in
            
            if error == nil{
                do{
                    self.item = try JSONDecoder().decode([Products].self, from: data!)
                }
                catch{
                    print("Error fetching data from API.")
                }
                
                DispatchQueue.main.async {
                    completed()
                }
            }
        }.resume()
    }
    
    
    @IBAction func btnPants(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Pants"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnShirts(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Shirts"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    
    @IBAction func btnTshirts(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Tshirts"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnJackets(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Jackets"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    @IBAction func btnAll(_ sender: UIButton) {
        searchProduct = []
        for word in items{
            if word.category == "Pants" || word.category == "Jackets" || word.category == "Shirts" || word.category == "Shorts" || word.category == "TShirts"
            {
//                searchProduct.append(word)

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
        cell.setup(with: item[indexPath.row])
        
        let imageURL = searchProduct[indexPath.row].image as? String
        
        if let url = URL(string: imageURL!){
            
            let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
                if let data = data{
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        cell.productImageView.image = image
                        cell.setNeedsLayout()
                    }
                }
            }.resume()
            cell.lblName.text = searchProduct[indexPath.row].title
            cell.lblPrice.text = "R " + "\(searchProduct[indexPath.row].price)"
            cell.productImageView.image = UIImage(named: searchProduct[indexPath.row].image)
            
            cell.reloadInputViews()
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
        }
        return cell
    }
}

extension menViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 187, height: 260)
    }
}

extension menViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProduct = []
        if searchText == ""
        {
            searchProduct = item
        }
        for word in item{
            if word.title.lowercased().contains(searchText.lowercased())
            {
              searchProduct.append(word)
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
        
        vc?.name = searchProduct[indexPath.row].title
        vc?.category = searchProduct[indexPath.row].category
//        vc?.colour = searchProduct[indexPath.row].colour
        vc?.price = searchProduct[indexPath.row].price
//        vc?.gender = searchProduct[indexPath.row].gender
        vc?.imgname = searchProduct[indexPath.row].image
//        vc?.size = searchProduct[indexPath.row].size
//        vc?.count = count
            self.navigationController?.pushViewController(vc!, animated: true)
        
        print(item[indexPath.row].category)
    }
}
