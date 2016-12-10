//
//  CSPFBCoverPicture.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import UIKit

class CSPFBCoverPicture: NSObject, NSCoding {
    
    var id : Int?
    var offset_x : Int?
    var offset_y : Int?
    var url : String?
    var imgCover : UIImage?
    
    init(jsonDic: Dictionary<String,AnyObject>){
    
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
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(offset_x, forKey: "offset_x")
        aCoder.encode(offset_y, forKey: "offset_y")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(UIImagePNGRepresentation(imgCover!), forKey: "imgCover")

    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        id = aDecoder.decodeObject(forKey: "id") as? Int
        offset_x = aDecoder.decodeObject(forKey:"offset_x") as? Int
        offset_y = aDecoder.decodeObject(forKey:"offset_y") as? Int
        url = aDecoder.decodeObject(forKey:"url") as? String
        imgCover = UIImage.init(data: aDecoder.decodeObject(forKey:"imgCover") as! Data)
    }
    
    
}
