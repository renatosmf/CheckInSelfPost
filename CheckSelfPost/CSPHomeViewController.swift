//
//  CSPHomeViewController.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var imgAvatarProfile: UIImageView!
    
    @IBOutlet weak var lbProfileName: UILabel!

    @IBOutlet weak var tvMenu: UITableView!
    
    private var user : CSPFBUser!
    private var menuItens : CSPMenuOptions!
    
    func initializeWithUser(user: CSPFBUser) {
        self.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvMenu.dataSource = self
        tvMenu.delegate = self
        
        configureVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureVC() {
        
        if user.cover != nil {
            
            self.view.backgroundColor = UIColor(patternImage: cropImage(screenshot: user.cover!.imgCover!))
        }
        
        
        if user.picture?.dataInfo != nil {
            imgAvatarProfile.image = user.picture?.dataInfo?.imgProfile
            
            imgAvatarProfile.layer.masksToBounds = true
            imgAvatarProfile.layer.borderWidth = 1.5
            imgAvatarProfile.layer.borderColor = UIColor.white.cgColor
            imgAvatarProfile.layer.cornerRadius = imgAvatarProfile.frame.height / 2
        }
        
        lbProfileName.text = user.name
        lbProfileName.sizeToFit()
        
        menuItens = CSPMenuOptions.contructMenu()
        
        tvMenu.backgroundColor = UIColor.clear
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return menuItens.listMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "menuCell")
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = menuItens.listMenu[indexPath.row].optionTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func cropImage(screenshot: UIImage) -> UIImage {
        let scale = screenshot.scale
        let imgSize = screenshot.size
        let screenHeight = UIScreen.main.bounds.height
        let bound = self.view.bounds.height
        let navHeight = self.navigationController!.navigationBar.frame.height
        let bottomBarHeight = screenHeight - navHeight - bound
        let crop = CGRect(x: 0, y: 0, width: (imgSize.width - 1) * scale, height: (imgSize.height - bottomBarHeight - 1) * scale)
        let cgImage = screenshot.cgImage!.cropping(to: crop)
        let image: UIImage = UIImage(cgImage: cgImage!)
        return image
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
