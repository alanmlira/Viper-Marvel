//
//  CharacterListProtocols.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/3/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

import Foundation

protocol CharacterListViewOutput: class {
    func viewIsReady()
}

protocol CharacterListViewInput: class {
    var output: CharacterListViewOutput? { get set }
    
    func setupInitialState()
}

protocol CharacterListRouterInput: class {
    var view: CharacterListViewInput? { get set }
}

protocol CharacterListModuleInput: class {
    var view: CharacterListViewInput? { get set }
    var interactor: CharacterListInteractorInput? { get set }
    var router: CharacterListRouterInput? { get set }
}

protocol CharacterListInteractorOutput: class {
    
}

protocol CharacterListInteractorInput: class {
    var output: CharacterListInteractorOutput? { get set }
}