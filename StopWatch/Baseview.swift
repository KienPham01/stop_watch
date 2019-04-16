//
//  Baseview.swift
//  Smartit
//
//  Created by Kien on 10/11/17.
//  Copyright © 2017 Kienpham. All rights reserved.
//

import UIKit




extension UIButton
{
    func skin(b:Bool)
    {
        self.titleLabel?.numberOfLines = 1;

        self.layer.cornerRadius = 50
        self.layer.frame.size.width = 100
        self.layer.frame.size.height = 100


  
        if(b)
        {
            self.layer.borderColor = UIColor.gray.cgColor
            self.layer.borderWidth = 1
            self.tintColor = UIColor.white
            self.backgroundColor = UIColor.green

        }
        
    }
}

extension UIImageView
{
    func skin() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}

