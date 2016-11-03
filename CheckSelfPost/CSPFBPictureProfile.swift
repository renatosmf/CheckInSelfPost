//
//  CSPFBPictureProfile.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import UIKit

class CSPFBPictureProfile : NSObject {
    
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
    
    static func makeFromDictionaryToObject(jsonDic: Dictionary<String,AnyObject>) -> CSPFBPictureProfile {
        
        let picture = CSPFBPictureProfile()
        
        if let a = (jsonDic["data"] as! Dictionary<String,AnyObject>)["height"] {
            
            picture.dataInfo?.height = a as? Int
        }
        
        if let b = (jsonDic["data"] as! Dictionary<String,AnyObject>)["width"] {
            
            picture.dataInfo?.width = b as? Int
        }
        
        if let c = (jsonDic["data"] as! Dictionary<String,AnyObject>)["url"] {
            
            picture.dataInfo?.url = c as? String
            
            let u = URL(string: picture.dataInfo!.url!)
            
            do {
                let imgData = try Data.init(contentsOf: u!)
                picture.dataInfo!.imgProfile = UIImage(data: imgData)
            }catch let error {
                NSLog("Error Dowload profile img: \(error)")
            }
        }
        
        return picture
    }
}
