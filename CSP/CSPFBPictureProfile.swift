//
//  CSPFBPictureProfile.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import UIKit

class CSPFBPictureProfile : NSObject, NSCoding {
    
    struct DataInfo {
        var height : Int?
        var width : Int?
        var url : String?
        var imgProfile : UIImage?
    }
    
    var dataInfo : DataInfo?
    
    override init() {
        self.dataInfo = DataInfo()
    }
    
    convenience init(jsonDic: Dictionary<String,AnyObject>){
        
        self.init()
        
        if let a = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["height"] {
            
            self.dataInfo?.height = a as? Int
        }
        
        if let b = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["width"] {
            
            self.dataInfo?.width = b as? Int
        }
        
        if let c = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["url"] {
            
            self.dataInfo?.url = c as? String
            
            let u = URL(string: self.dataInfo!.url!)
            
            do {
                let imgData = try Data.init(contentsOf: u!)
                self.dataInfo!.imgProfile = UIImage(data: imgData)
            }catch let error {
                NSLog("Error Dowload profile img: \(error)")
            }
        }
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(dataInfo?.height, forKey: "height")
        aCoder.encode(dataInfo?.width, forKey: "width")
        aCoder.encode(dataInfo?.url, forKey: "url")
        aCoder.encode(UIImagePNGRepresentation(dataInfo!.imgProfile!), forKey: "imgProfile")
    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        dataInfo?.height = aDecoder.decodeObject(forKey: "height") as? Int
        dataInfo?.width = aDecoder.decodeObject(forKey:"width") as? Int
        dataInfo?.url = aDecoder.decodeObject(forKey:"url") as? String
        dataInfo?.imgProfile = UIImage.init(data: aDecoder.decodeObject(forKey:"imgProfile") as! Data)
    }

}
