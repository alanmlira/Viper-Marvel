//
//  StringExtension.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/6/16.
//  Copyright © 2016 Alan Lira. All rights reserved.
//

import UIKit

extension String {
    func beginsWith (str: String) -> Bool {
        if let range = self.rangeOfString(str) {
            return range.startIndex == self.startIndex
        }
        return false
    }
}