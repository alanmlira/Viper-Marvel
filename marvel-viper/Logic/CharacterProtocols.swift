//
//  CharacterProtocols.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/7/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  VIPER Template: https://github.com/gui-assis/ViperTemplate
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

import Foundation

protocol CharacterViewOutput: class {
    func viewIsReady()
}

protocol CharacterViewInput: class {
    var output: CharacterViewOutput? { get set }
    
    func setupInitialState()
}

protocol CharacterRouterInput: class {
    var view: CharacterViewInput? { get set }
}

protocol CharacterModuleInput: class {
    var view: CharacterViewInput? { get set }
    var interactor: CharacterInteractorInput? { get set }
    var router: CharacterRouterInput? { get set }
}

protocol CharacterInteractorOutput: class {
    
}

protocol CharacterInteractorInput: class {
    var output: CharacterInteractorOutput? { get set }
}