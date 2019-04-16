//
//  SwitchStatus.swift
//  StopWatch
//
//  Created by Kien on 12/13/17.
//  Copyright © 2017 Kien. All rights reserved.
//

import Foundation
enum SwitchStatus:Toggleable{
    case on,off
    mutating func toogle() {
        switch self {
        case .on:
            self  = .off
            break
        case.off:
            self = .on
            break
        default:
            self = .off
//            print("dit mie nha m")
        }
    }
    
    
}
