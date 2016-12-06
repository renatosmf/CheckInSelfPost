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
    @IBOutlet weak var imgCoverBackGround: UIImageView!
    
    @IBOutlet weak var lbProfileName: UILabel!

    @IBOutlet weak var tvMenu: UITableView!
    
    private var user : CSPFBUser!
    private var menuItens : CSPMenuOptions!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvMenu.dataSource = self
        tvMenu.delegate = self
        
        self.user = CSPCurrentUser.sharedInstance.user!
        
        configureVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureVC() {
        
        if user.cover != nil {

            addBlurEffect(in: self.imgCoverBackGround, withBounds: self.view.bounds)
            self.imgCoverBackGround.image = user.cover?.imgCover
            self.imgCoverBackGround.contentMode = .scaleAspectFill
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
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
        cell.textLabel?.textColor = UIColor.white
        
        switch indexPath.row {
        case 0:
            cell.imageView?.image = UIImage(named: "ic_menu_checkin")
        case 1:
            cell.imageView?.image = UIImage(named: "ic_menu_camera")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    func addBlurEffect(in view: UIView , withBounds: CGRect) {
        // Add blur view
        let bounds = withBounds
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
        visualEffectView.alpha = 0.85
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(visualEffectView)
    }
    
    
    @IBAction func settingBtToggle(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
        actionSheet.addAction(UIAlertAction.init(title: "cancelar", style: .cancel, handler: { (_) in }))

       actionSheet.addAction(UIAlertAction.init(title: "Logout", style: .destructive, handler: { (actLogout) in
        
            CSPFBLoginManager.logout(navController: self.navigationController!)
       }))
    
        self.present(actionSheet, animated: true, completion: nil)
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
