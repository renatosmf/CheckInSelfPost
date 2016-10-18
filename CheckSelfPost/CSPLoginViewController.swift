//
//  CSPLoginViewController.swift
//  CheckSelfPost
//
//  Created by Renato Machado on 10/15/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class CSPLoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var btFBLogin: FBSDKLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btFBLogin.readPermissions = ["public_profile", "email", "user_friends"];
        btFBLogin.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        NSLog("Logged")
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        NSLog("Logout")
    }
   
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        NSLog("Will Login")
        
        return true
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
