//
//  CharacterListViewController.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/3/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  Authors: 
//    - Guilherme Assis http://github.com/gui-assis 
//    - Alan Lira http://github.com/alanmlira

import UIKit

class CharacterListViewController: UIViewController, CharacterListViewInput {

    var output: CharacterListViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterListModuleConfigurator.configure(self)
        output!.viewIsReady()
    }


    // MARK: CharacterListViewInput
    func setupInitialState() {
    }
}
