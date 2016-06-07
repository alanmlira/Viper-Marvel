//
//  CharacterViewController.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/7/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  VIPER Template: https://github.com/gui-assis/ViperTemplate
//  Authors: 
//    - Guilherme Assis http://github.com/gui-assis 
//    - Alan Lira http://github.com/alanmlira

import UIKit

class CharacterViewController: UIViewController, CharacterViewInput {

    var output: CharacterViewOutput?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterModuleConfigurator.configure(self)
        output!.viewIsReady()
    }


    // MARK: CharacterViewInput
    func setupInitialState() {
    }
}
