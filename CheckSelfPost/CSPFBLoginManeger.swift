//
//  CSPFBLoginManeger.swift
//  CSP
//
//  Created by Renato Machado on 10/18/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import FBSDKLoginKit


class CSPFBLoginManager: AnyObject {
    
    static public var BT_READ_PERMISIONS = ["public_profile", "email", "user_friends"]
    static private var PUBLISH_ACTIONS = "publish_actions"
    
    static private let screenWidth = UIScreen.main.bounds.width
    static private let screenHeight = UIScreen.main.bounds.height
    
    
   static func getFBCurrentToken() -> FBSDKAccessToken? {
        if let accessTokenFB = FBSDKAccessToken.current() {
            NSLog("User logged !!! \n\nToken: \(accessTokenFB.tokenString!)")
            return accessTokenFB
        }
        return nil
    }
    
   static func returnUserData(callback: @escaping (CSPFBUser?) -> Void)
    {
//        let h = screenHeight
//        let w = screenWidth
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480),cover"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("\n\nError: \(error)")
                callback(nil)
            }
            else
            {
                print("\n\nfetched user: \(result!)")
                let id : NSString = (result as? [String:AnyObject])?["id"] as! NSString
                print("User ID is: \(id)")
                
                let fbUser = CSPFBUser.parseObj(json:(result! as? [String:AnyObject])!)
                print("FB USER INFO: \(fbUser)")
                
                CSPCurrentUser.sharedInstance.user = fbUser
                
                callback(fbUser)
                //etc...
            }
        })
        
    }
    
    
    static func checkPublishPermissions(vc: UIViewController) {
        
        if FBSDKAccessToken.current().hasGranted(PUBLISH_ACTIONS) {
            
            // Can make a publish
            NSLog("Has Permitions!!")
            
        }else{
            
            // Request permition to publish
           FBSDKLoginManager().logIn(withPublishPermissions: [PUBLISH_ACTIONS], from: vc, handler: { (result, error) in
            
            if error != nil {
                NSLog("ERROR REQ. PUBLISH PERMITIONS: \(error)")
            }else{
                
                if result!.declinedPermissions.contains(PUBLISH_ACTIONS) {
                    
                }
            }
            
           })
        }
    }
    
    static func logout(navController: UINavigationController) {
        FBSDKLoginManager().logOut()
        
        CSPCurrentUser.sharedInstance.cleanUser()
        
        navController.popToRootViewController(animated: false)
    }
}
