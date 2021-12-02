////
////  DigimonManager.swift
////  API_DigimonList
////
////  Created by Martinus Galih Widananto on 02/12/21.
////
//
//import Foundation
//
//protocol DigimonManagerDelegate {
//    func didUpdateDigimon(_ infoManager: DigimonManager, digimon: DigimonModel)
//    func didFailWithError(error: Error)
//}
//
//struct DigimonManager {
//    let digimonURL = "https://digimon-api.vercel.app/api/digimon/"
//    func fetchInfo() {
//        let urlString = "\(digimonURL)"
//        performRequest(with: urlString)
//    }
//    
//    var delegate: DigimonManagerDelegate?
//    
//    func performRequest(with urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let digimon = self.parseJSON(safeData) {
//                        self.delegate?.didUpdateDigimon(self, digimon: digimon)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    func parseJSON(_ data: Data) -> DigimonModel? {
//        var digimons = [DigimonModel]()
//        let decoder = JSONDecoder()
//        do {
//            digimons = try! JSONDecoder().decode([DigimonModel].self, from: data)
//            let name = digimons[2].name
//            let img = digimons[2].img
//            let lvl = digimons[2].level
//            
//           
//            
//            let digimon = DigimonModel(name: name, img: img, level: lvl)
//            var i = 0
//            while i < digimons.count {
//                print(digimons[i].name)
//                i = i + 1
//            }
//            
//            print(digimons.count)
//          
//            return digimon
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
//    
//}
