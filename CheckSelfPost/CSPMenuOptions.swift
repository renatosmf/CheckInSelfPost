//
//  CSPMenuOptions.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation


class CSPMenuOptions: NSObject {
    
    
    struct menu {
        let imgName : String?
        let optionTitle : String!
        let navigateToScreenName : String!
        
        init(icName: String?, title: String, NavToScreenName: String) {
            imgName = icName
            optionTitle = title
            navigateToScreenName = NavToScreenName
        }
    }
    
    var listMenu : Array<menu> = []
    
    static func contructMenu() -> CSPMenuOptions {

        let cspMenu = CSPMenuOptions()
        
        let m1 = menu.init(icName: nil, title: "Check-In de convidados", NavToScreenName: "CSPCheckIn")
        let m2 = menu.init(icName: nil, title: "Selfie com os Noivos", NavToScreenName: "CSPSelfieWithBrideAndGroom")
        
        cspMenu.listMenu = [m1, m2]
        
        return cspMenu
    }
}
