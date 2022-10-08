//
//  Extentions.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation
import UIKit


extension UIImageView {
    
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            DispatchQueue.main.async {
                self.image = UIImage(named: "default")
            }
            return
        }
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
                else{
                    DispatchQueue.main.async {
                        self?.image = UIImage(named: "default")
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "default")
                }
            }
        }
    }
}


extension String {

  func convertToDate() -> String {
   
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
      if let dt = dateFormatter.date(from: self) {
          dateFormatter.dateFormat = "MMM dd,yyyy"
          let formatedStringDate = dateFormatter.string(from: dt)
              return formatedStringDate
      }
    
   
      return "01-01-70"
  }
}

extension UIColor {
    
    static let mainBrand = UIColor(red:0.768, green:0.008 ,blue:0.008, alpha:1.00) //#C40202


}
