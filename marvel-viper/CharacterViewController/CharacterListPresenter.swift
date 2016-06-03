//
//  CharacterListPresenter.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/3/16.
//  Copyright (c) 2016 Alan Lira. All rights reserved.
//
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

class CharacterListPresenter: CharacterListModuleInput, CharacterListViewOutput, CharacterListInteractorOutput {

    var view: CharacterListViewInput?
    var interactor: CharacterListInteractorInput?
    var router: CharacterListRouterInput?

    func viewIsReady() {
        
    }
}
