//
//  ViewController.swift
//  API_DigimonList
//
//  Created by Martinus Galih Widananto on 02/12/21.
//

import UIKit

class ViewController: UIViewController {
    //    var digimonManager = DigimonManager()
    var digimons1 = [DigimonModel]()
    
    private var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4 , height: (view.frame.size.width/3)-4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        //        digimonManager.delegate = self
        //        print(digimonManager.fetchInfo())
        let url = URL(string: "https://digimon-api.vercel.app/api/digimon/")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.digimons1 = try JSONDecoder().decode([DigimonModel].self, from: data!)
                    
                } catch {
                    print("Parse Error")
                }
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                    
                }
                
            }
        }.resume()
        
    }
    
    func getImage(from string: String) -> UIImage? {
        //Get valid URL
        guard let url = URL(string: string)
        else {
            print("Unable to create URL")
            return nil
        }
        
        var image: UIImage? = nil
        do {
            //Get valid data
            let data = try Data(contentsOf: url, options: [])
            
            //Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return image
    }
    
    
}

// MARK: - DigimonManagerDelegate
//extension ViewController: DigimonManagerDelegate {
//    func didUpdateDigimon(_ infoManager: DigimonManager, digimon: DigimonModel) {
//        DispatchQueue.main.async {
////            digimons = digimon.name
//            print(self.digimons1)
//        }
//    }
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//}


// MARK: - UICollectionView
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return digimons1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async {
            cell.configureName(label: self.digimons1[indexPath.row].name)
            cell.configureRank(label: self.digimons1[indexPath.row].level)

            if let image = self.getImage(from: self.digimons1[indexPath.row].img) {
                //Apply image
                cell.configureImage(img: image)
            }
        }
        return cell
        
    }
}


