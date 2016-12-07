//
//  CSPFBCoverPicture.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import UIKit

class CSPFBCoverPicture: NSObject {
    
    var id : Int?
    var offset_x : Int?
    var offset_y : Int?
    var url : String?
    var imgCover : UIImage?
    
    func makeFromDictionaryToObject(jsonDic: Dictionary<String,AnyObject>) -> CSPFBCoverPicture {
    
        if let a = jsonDic["id"] as? String {
            self.id = Int(a)
        }
        if let b = jsonDic["offset_y"] as? Int {
            self.offset_y = b
        }
        if let c = jsonDic["offset_x"] as? Int {
            self.offset_x = c
        }
        if let d = jsonDic["source"] as? String {
            self.url = d
            
            let u = URL(string: d)
            
            do {
                let imgData = try Data.init(contentsOf: u!)
                self.imgCover = UIImage(data: imgData)
                
            }catch let error {
            
                NSLog("Error Dowload cover img: \(error)")
            }
        }
        
        return self
    }
}
