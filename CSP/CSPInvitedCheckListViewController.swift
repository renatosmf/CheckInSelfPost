//
//  CSPInvitedCheckListViewController.swift
//  CSP
//
//  Created by Renato Machado on 12/14/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPInvitedCheckListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tvInvitedList: UITableView!
    @IBOutlet weak var btContinue: UIButton!
    
    let invitedCellIdentifier = "invitedCell"
    var invitedList : [CSPGuest] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tvInvitedList.delegate = self
        self.tvInvitedList.dataSource = self
        self.tvInvitedList.rowHeight = UITableViewAutomaticDimension
        self.tvInvitedList.estimatedRowHeight = 41
        
        self.btContinue.layer.cornerRadius = 8.0
        self.btContinue.clipsToBounds = true
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //invitedList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 41
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .default, reuseIdentifier: invitedCellIdentifier) as? CSPCheckListTableViewCell
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("CSPCheckListTableViewCell", owner: nil, options: nil)?[0] as? CSPCheckListTableViewCell
        }
        
        //cell?.lbInvitedName.text = self.invitedList[indexPath.row].name
        cell?.lbInvitedName.text = "Renato"
        cell?.btCheck.isSelected = false//self.invitedList[indexPath.row].isChecked
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tvInvitedList.cellForRow(at: indexPath) as? CSPCheckListTableViewCell else {
            return
        }
                
        if cell.btCheck.isSelected {
            cell.btCheck.isSelected = false
//            self.invitedList[indexPath.row].isChecked = false
        }else{
            cell.btCheck.isSelected = true
//            self.invitedList[indexPath.row].isChecked = true
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    @IBAction func btContinueTapped(_ sender: UIButton) {
        
        
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
