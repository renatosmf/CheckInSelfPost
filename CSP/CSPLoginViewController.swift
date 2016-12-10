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
        
        let userIsSaved = CSPFBLoginManager.containUserSaved()
        
        if userIsSaved {
            CSPLoading.showLoading()
            
            CSPFBLoginManager.login(callback: { (success, erroMsg) in
                CSPLoading.hideLoading()
                
                if success! {
                    
                    self.goToHomeScreen()

                    if erroMsg !=  nil {
                        CSPAlertHelper.alertWithTile(title: "Atenção", message: erroMsg!, buttons: [("Ok", nil)], viewController: self)
                    }
                    
                }else{
                    
                     CSPAlertHelper.alertWithTile(title: "Atenção", message: erroMsg!, buttons: [("Ok", nil)], viewController: self)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

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
    
        if error != nil {
            NSLog("Error at try make Login")
            
            CSPAlertHelper.alertWithTile(title: "Error", message: "Falha ao realizar login no Facebook.", buttons: [("Ok", nil)], viewController: self)
            
        }else if result.isCancelled {
            NSLog("Login Cancelled")
            
            
        }else{
            
            NSLog("Logged")
            CSPLoading.showLoading()
            
            CSPFBLoginManager.login(callback: { (success, erroMsg) in
                
                CSPLoading.hideLoading()
                
                if success! {
                    
                    self.goToHomeScreen()

                    if erroMsg !=  nil {
                        CSPAlertHelper.alertWithTile(title: "Atenção", message: erroMsg!, buttons: [("Ok", nil)], viewController: self)
                    }
                    
                }else{
                    
                    CSPAlertHelper.alertWithTile(title: "Atenção", message: erroMsg!, buttons: [("Ok", nil)], viewController: self)
                }
                
            })
            
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        NSLog("Logout")
        CSPFBLoginManager.logout(vc: self)
    
    }
   
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        NSLog("Will Login")
        
        return true
    }

    
    func goToHomeScreen() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeVCIdentifier") as? CSPHomeViewController
        
        nextViewController?.navigationItem.setHidesBackButton(true, animated: false)
        
        nextViewController?.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: nil, style: .done, target: nil, action: nil)
        
        self.navigationController?.pushViewController(nextViewController!, animated: true)
        
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
