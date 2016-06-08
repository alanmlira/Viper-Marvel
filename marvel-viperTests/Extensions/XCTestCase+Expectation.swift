//
//  XCTestCase+Expectation.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/8/16.
//  Copyright © 2016 Alan Lira. All rights reserved.
//

import Foundation

import XCTest

extension XCTestCase {
    func waitForExpectations() {
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}