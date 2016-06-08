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

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output: CharacterViewOutput?
    
    private var characterList: [CharacterModel]?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharacterModuleConfigurator.configure(self)
        
        setupTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        output?.viewIsReady()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }
}


// MARK: CharacterViewInput

extension CharacterViewController : CharacterViewInput {
    
    // MARK: CharacterViewInput
    
    
    func showListView(characters: [CharacterModel]) {
        characterList = characters
        tableView.reloadData()
    }
    
}


// MARK: UITableViewDataSource

extension CharacterViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = initCell()
        cell.imageView?.image = nil
        
        if let text = characterList?[indexPath.row].name, imgUrl = characterList?[indexPath.row].thumbnail.getThumbUrl().absoluteString {
            setupCell(cell, text: text, urlImage: imgUrl)
        }
        
        return cell
    }
    
    // MARK: Private
    
    private func initCell() -> UITableViewCell {
        let identifier = ReuseIdentifier.CharacterCell
        return tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
    }
    
    private func setupCell(cell: UITableViewCell, text: String, urlImage: String) {
        cell.textLabel?.text = text
        cell.imageView?.loadImageWithUrl(urlImage, placeholder: nil)
    }
    
}