//
//  NewsItem.swift
//  YahooNews
//
//  Created by Brian Vo on 2018-05-22.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    var category: Categories
    var headline: String
}

enum Categories {
    case World, Americas, Europe, MiddleEast, Africa, Asia
    
    func string() -> String {
        switch self {
        case .World:
            return "World"
        case .Americas:
            return "Americas"
        case .Europe:
            return "Europe"
        case .MiddleEast:
            return "Middle East"
        case .Africa:
            return "Africa"
        case .Asia:
            return "Asia"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .World:
            return UIColor.red
        case .Americas:
            return UIColor.blue
        case .Europe:
            return UIColor.green
        case .Africa:
            return UIColor.orange
        case .Asia:
            return UIColor.purple
        case .MiddleEast:
            return UIColor.yellow
        }
    }
}
