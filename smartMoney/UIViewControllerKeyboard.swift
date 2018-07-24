//
//  UIViewController+Navigation.swift
//  PilotPlantSwift
//
//  Created by lingostar on 2014. 10. 28..
//  Copyright (c) 2014년 lingostar. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    @IBAction func keyboardDismiss(_ sender : Any){
        for v in self.view.subviews {
            if v.isFirstResponder {
                v.resignFirstResponder()
            }
        }
    }    
}
















