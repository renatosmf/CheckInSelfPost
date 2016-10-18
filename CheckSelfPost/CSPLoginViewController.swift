//
//  CSPLoginViewController.swift
//  CSP
//
//  Created by Renato Machado on 10/15/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class CSPLoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginButton: FBSDKLoginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drawFBbutton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    private func drawFBbutton () {
        
        loginButton.readPermissions = CSPFBLoginManager.BT_READ_PERMISIONS
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        let widthConstraint = loginButton.widthAnchor.constraint(equalToConstant: self.view.frame.size.width - 40)
        let heightConstraint = loginButton.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        NSLog("Logged")
    
        CSPFBLoginManager.returnUserData()
        CSPFBLoginManager.checkPublishPermissions(vc: self)

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
