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

    
    static func getFBCurrentToken() -> FBSDKAccessToken? {
        if let accessTokenFB = FBSDKAccessToken.current() {
            NSLog("User logged !!! \n\nToken: \(accessTokenFB.tokenString!)")
            return accessTokenFB
        }
        return nil
    }

    private static func checkPublishPermissions(vc: UIViewController) {
        
        if FBSDKAccessToken.current().hasGranted(PUBLISH_ACTIONS) {
            
            // Can make a publish
            NSLog("Has Permitions!!")
            
        }else{
            
            // Request permition to publish
           FBSDKLoginManager().logIn(withPublishPermissions: [PUBLISH_ACTIONS], from: vc, handler: { (result, error) in
            
            if error != nil {
                NSLog("ERROR REQ. PUBLISH PERMITIONS: \(error)")
            }else{
                
//                if (result?.declinedPermissions.contains(PUBLISH_ACTIONS)) != nil {
//                    
//                }
            }
            
           })
        }
    }
    
    class func logout(vc: UIViewController? = nil) {
        
        FBSDKLoginManager().logOut()
        self.releaseUserData()
        
        if vc != nil {
            for vc in vc!.navigationController!.viewControllers {
                if vc is CSPLoginViewController && vc.navigationController!.viewControllers.count > 0 {
                    _ = vc.navigationController?.popViewController(animated: false)
                }
            }
        }
    }
    
    
    class func login(callback: @escaping (Bool?) -> Void) {
        
        if let userData = loadUserData().userData {
           let _ = FBSDKAccessToken.setCurrent(userData.tokenSession?.token)
            
        }
        
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480),cover"])
            
            graphRequest.start(completionHandler: { (connection, result, error) -> Void in
                
                if ((error) != nil)
                {
                    // Process error
                    print("\n\nError: \(error)")
                    logout()
                    callback(false)
                    return
                }
                else
                {
                    print("\n\nfetched user: \(result!)")
                    
                    let id : NSString = (result as? [String:AnyObject])?["id"] as! NSString
                    print("User ID is: \(id)")
                    
                    let fbUser = CSPFBUser.init(json:(result! as? [String:AnyObject])!)
                    print("FB USER INFO: \(fbUser)")
                    
                    CSPCurrentUser.initInstanceWithUser(user: fbUser)
                    let successSaveUserData = retrievedUserData()
                    
                    callback(successSaveUserData)
                    return
                    //etc...
                }
            })
        
    }
    
    static private func retrievedUserData() -> Bool{
        
        if CSPCurrentUser.sharedInstance.user !=  nil {
            
            let data : Data?
            
            data = NSKeyedArchiver.archivedData(withRootObject: CSPCurrentUser.sharedInstance.user!)
        
            if data == nil { NSLog("ERROR Retrieve user : NSKeyedArchiver is nil"); return false }
            
            UserDefaults.standard.set(data, forKey: "currentUser")
            return true
        
        } else {
            
            NSLog("ERROR Retrieve user : UserData is nil")
            return false
        }
    }
    
    static private func loadUserData() -> (contain: Bool, userData: CSPFBUser?){
        
        guard let data = UserDefaults.standard.object(forKey:"currentUser") as? Data else {
            NSLog("ERROR Load user : UserDefaults nil")
            return (false, nil)
        }
        
      
        guard let user = NSKeyedUnarchiver.unarchiveObject(with: data) as? CSPFBUser else{
            NSLog("ERROR Load user : NSKeyedUnarchiver")
            return (false, nil)
        }
        
        CSPCurrentUser.initInstanceWithUser(user: user)
        return (true, user)
        
    }
    
    class func containUserSaved() -> Bool {
        
        guard let data = UserDefaults.standard.object(forKey:"currentUser") as? Data else {
            NSLog("ERROR Load user : UserDefaults is nil")
            return false
        }
        
        
        guard let _ = NSKeyedUnarchiver.unarchiveObject(with: data) as? CSPFBUser else{
            NSLog("ERROR Load user : NSKeyedUnarchiver")
            return false
        }
        
        return true
    }
    
    static private func releaseUserData(){
        UserDefaults.standard.removeObject(forKey: "currentUser")
        CSPCurrentUser.sharedInstance.cleanUser()
    }
    
}
