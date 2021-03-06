//
//  CharacterPresenter.swift
//  marvel-viper
//
//  Created by Alan Lira on 6/8/16.
//  Copyright © 2016 Alan Lira. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import marvel_viper

class TaskListPresenterTests : XCTestCase {
    var presenter: CharacterPresenter!
    
    // MARK: XCTestCase
    
    override func setUp() {
        presenter = CharacterPresenter()
    }
    
    // MARK: Test cases
    
    func testUpdateView() {
        let expectation = self.expectationWithDescription("Check if presenter call interactor's fetchList method")
        
        let interactor = CharacterInteractorMock()
        interactor.expectation = expectation
        
        presenter.interactor = interactor
        presenter.viewIsReady()
        
        waitForExpectations()
    }
    
    func testDidFetchList() {
        let expectation = self.expectationWithDescription("Check if presenter call view's showList method")
        
        let view = CharacterViewMock()
        view.expectation = expectation
        
        let list = createCharacterList()
        
        presenter.view = view
        presenter.didFetchCharacterList(list)
        
        waitForExpectations()
        
        XCTAssertEqual(view.list?.count, list.count)
        
        for i in 0..<list.count {
            XCTAssertEqual(view.list?[i].name, list[i].name)
        }
    }
    
//    func testDidFailFetchList() {
//        let expectation = self.expectationWithDescription("Check if presenter call view's showAlert method")
//        
//        let view = createCharacterList()
//        view.expectation = expectation
//        
//        presenter.view = view
//        presenter.didFailFetchList(.EmptyList)
//        
//        waitForExpectations()
//        
//        XCTAssertEqual(view.title, "Error")
//        XCTAssertEqual(view.description, "Your task list is empty! Go and find something to do!")
//    }
    
    // MARK: Private
    
    private func createCharacterList() -> [CharacterModel] {
        var characters: [CharacterModel] = []

        for json in JSON.parse(jsonCharacter).arrayValue {
            characters.append(CharacterModel(json: json)!)
        }
        
        return characters
    }
    
    let jsonCharacter = "[{\"id\":1011334,\"name\":\"3-D Man\",\"description\":\"\",\"modified\":\"2014-04-29T14:18:17-0400\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784\",\"extension\":\"jpg\"},\"resourceURI\":\"http://gateway.marvel.com/v1/public/characters/1011334\",\"comics\":{\"available\":11,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1011334/comics\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/21366\",\"name\":\"Avengers: The Initiative (2007) #14\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/24571\",\"name\":\"Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/21546\",\"name\":\"Avengers: The Initiative (2007) #15\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/21741\",\"name\":\"Avengers: The Initiative (2007) #16\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/21975\",\"name\":\"Avengers: The Initiative (2007) #17\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/22299\",\"name\":\"Avengers: The Initiative (2007) #18\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/22300\",\"name\":\"Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/22506\",\"name\":\"Avengers: The Initiative (2007) #19\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/10223\",\"name\":\"Marvel Premiere (1972) #35\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/10224\",\"name\":\"Marvel Premiere (1972) #36\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/10225\",\"name\":\"Marvel Premiere (1972) #37\"}],\"returned\":11},\"series\":{\"available\":2,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1011334/series\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1945\",\"name\":\"Avengers: The Initiative (2007 - 2010)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/2045\",\"name\":\"Marvel Premiere (1972 - 1981)\"}],\"returned\":2},\"stories\":{\"available\":17,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1011334/stories\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19947\",\"name\":\"Cover #19947\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19948\",\"name\":\"The 3-D Man!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19949\",\"name\":\"Cover #19949\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19950\",\"name\":\"The Devil's Music!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19951\",\"name\":\"Cover #19951\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/19952\",\"name\":\"Code-Name:  The Cold Warrior!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/47185\",\"name\":\"Avengers: The Initiative (2007) #14 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/47499\",\"name\":\"Avengers: The Initiative (2007) #15 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/47792\",\"name\":\"Avengers: The Initiative (2007) #16\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/47793\",\"name\":\"Avengers: The Initiative (2007) #16 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/48362\",\"name\":\"Avengers: The Initiative (2007) #17 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/49104\",\"name\":\"Avengers: The Initiative (2007) #18 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/49106\",\"name\":\"Avengers: The Initiative (2007) #18, Zombie Variant - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/49888\",\"name\":\"Avengers: The Initiative (2007) #19\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/49889\",\"name\":\"Avengers: The Initiative (2007) #19 - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/54371\",\"name\":\"Avengers: The Initiative (2007) #14, Spotlight Variant - Int\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/96303\",\"name\":\"Deadpool (1997) #44\",\"type\":\"interiorStory\"}],\"returned\":17},\"events\":{\"available\":1,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1011334/events\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/events/269\",\"name\":\"Secret Invasion\"}],\"returned\":1},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"},{\"type\":\"wiki\",\"url\":\"http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"},{\"type\":\"comiclink\",\"url\":\"http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"}]},{\"id\":1017100,\"name\":\"A-Bomb (HAS)\",\"description\":\"Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! \",\"modified\":\"2013-09-18T15:54:04-0400\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16\",\"extension\":\"jpg\"},\"resourceURI\":\"http://gateway.marvel.com/v1/public/characters/1017100\",\"comics\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1017100/comics\",\"items\":[],\"returned\":0},\"series\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1017100/series\",\"items\":[],\"returned\":0},\"stories\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1017100/stories\",\"items\":[],\"returned\":0},\"events\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1017100/events\",\"items\":[],\"returned\":0},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/76/a-bomb?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"},{\"type\":\"comiclink\",\"url\":\"http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"}]},{\"id\":1009144,\"name\":\"A.I.M.\",\"description\":\"AIM is a terrorist organization bent on destroying the world.\",\"modified\":\"2013-10-17T14:41:30-0400\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec\",\"extension\":\"jpg\"},\"resourceURI\":\"http://gateway.marvel.com/v1/public/characters/1009144\",\"comics\":{\"available\":30,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1009144/comics\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/36763\",\"name\":\"Ant-Man & the Wasp (2010) #3\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/17553\",\"name\":\"Avengers (1998) #67\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/7340\",\"name\":\"Avengers (1963) #87\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/1170\",\"name\":\"Avengers Vol. 2: Red Zone (Trade Paperback)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/1214\",\"name\":\"Avengers Vol. II: Red Zone (Trade Paperback)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/12787\",\"name\":\"Captain America (1998) #28\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/20367\",\"name\":\"Defenders (1972) #57\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/31068\",\"name\":\"Incredible Hulks (2009) #606 (VARIANT)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/36737\",\"name\":\"Marvel Adventures Super Heroes (2010) #16\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/2110\",\"name\":\"Marvel Masterworks: Captain America Vol. (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/1130\",\"name\":\"Marvel Masterworks: Captain America Vol. 1 - 2nd Edition (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/2319\",\"name\":\"Marvel Masterworks: Doctor Strange Vol. (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/2820\",\"name\":\"Marvel Masterworks: Doctor Strange Vol. (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/2001\",\"name\":\"Marvel Masterworks: The Invincible Iron Man Vol. (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/17468\",\"name\":\"Marvel Masterworks: The Invincible Iron Man Vol. 1 (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/1164\",\"name\":\"Marvel Masterworks: The Silver Surfer Vol. 2 (Hardcover)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/11068\",\"name\":\"Strange Tales (1951) #146\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/11069\",\"name\":\"Strange Tales (1951) #147\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/11070\",\"name\":\"Strange Tales (1951) #148\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/11324\",\"name\":\"Tales of Suspense (1959) #79\"}],\"returned\":20},\"series\":{\"available\":22,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1009144/series\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/13082\",\"name\":\"Ant-Man & the Wasp (2010 - 2011)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1991\",\"name\":\"Avengers (1963 - 1996)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/354\",\"name\":\"Avengers (1998 - 2004)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/227\",\"name\":\"Avengers Vol. 2: Red Zone (2003)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/271\",\"name\":\"Avengers Vol. II: Red Zone (2003)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1997\",\"name\":\"Captain America (1998 - 2002)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/3743\",\"name\":\"Defenders (1972 - 1986)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/8842\",\"name\":\"Incredible Hulks (2009 - 2011)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/9718\",\"name\":\"Marvel Adventures Super Heroes (2010 - 2012)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1506\",\"name\":\"Marvel Masterworks: Captain America Vol. (2005)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/189\",\"name\":\"Marvel Masterworks: Captain America Vol. 1 - 2nd Edition (2003)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1468\",\"name\":\"Marvel Masterworks: Doctor Strange Vol. (2005)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/1494\",\"name\":\"Marvel Masterworks: The Invincible Iron Man Vol. (2005)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/3300\",\"name\":\"Marvel Masterworks: The Invincible Iron Man Vol. 1 (0000 - Present)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/222\",\"name\":\"Marvel Masterworks: The Silver Surfer Vol. 2 (2003)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/2076\",\"name\":\"Strange Tales (1951 - 1968)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/2079\",\"name\":\"Tales of Suspense (1959 - 1968)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/13213\",\"name\":\"Taskmaster (2010 - Present)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/2258\",\"name\":\"Uncanny X-Men (1963 - 2011)\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/632\",\"name\":\"Wolverine (2003 - 2009)\"}],\"returned\":20},\"stories\":{\"available\":28,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1009144/stories\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10253\",\"name\":\"When the Unliving Strike\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10255\",\"name\":\"Cover #10255\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10256\",\"name\":\"The Enemy Within!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10259\",\"name\":\"Death Before Dishonor!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10261\",\"name\":\"Cover #10261\",\"type\":\"cover\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/10262\",\"name\":\"The End of A.I.M.!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11921\",\"name\":\"The Red Skull Lives!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11930\",\"name\":\"He Who Holds the Cosmic Cube\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11936\",\"name\":\"The Maddening Mystery of the Inconceivable Adaptoid!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11981\",\"name\":\"If This Be... Modok\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11984\",\"name\":\"A Time to Die -- A Time to Live!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/11995\",\"name\":\"At the Mercy of the Maggia\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/15243\",\"name\":\"Look Homeward, Avenger\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/28233\",\"name\":\"In Sin Airy X\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/28971\",\"name\":\"[The Brothers Part I]\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/34426\",\"name\":\"The Red Skull Lives!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/34435\",\"name\":\"He Who Holds the Cosmic Cube\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/34441\",\"name\":\"The Maddening Mystery of the Inconceivable Adaptoid!\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/34486\",\"name\":\"If This Be... Modok\",\"type\":\"interiorStory\"},{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/34489\",\"name\":\"A Time to Die -- A Time to Live!\",\"type\":\"interiorStory\"}],\"returned\":20},\"events\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/characters/1009144/events\",\"items\":[],\"returned\":0},\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/characters/77/aim.?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"},{\"type\":\"wiki\",\"url\":\"http://marvel.com/universe/A.I.M.?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"},{\"type\":\"comiclink\",\"url\":\"http://marvel.com/comics/characters/1009144/aim.?utm_campaign=apiRef&utm_source=581a3796f12674d1534129b5aa5af43c\"}]}]"
}

// MARK: Mocks TaskListView

class CharacterViewMock : CharacterViewInput {
    var expectation: XCTestExpectation?
    var output: CharacterViewOutput?
    var list: [CharacterModel]?
    var title: String?
    var description: String?
    
    func showListView(characters: [CharacterModel]) {
        self.list = characters
        expectation?.fulfill()
    }
    
    func showAlert(title title: String, description: String) {
        self.title = title
        self.description = description
        expectation?.fulfill()
    }
    
}

// MARK: Mocks CharacterInteractor

class CharacterInteractorMock : CharacterInteractorInput {
    var expectation: XCTestExpectation?
    weak var output: CharacterInteractorOutput?
    
    func fetchList(offset: Int, characterName: String? = nil) {
        expectation?.fulfill()
    }
    
}

// MARK: Mocks CharacterRouterMock

class CharacterRouterMock : CharacterRouter {
    var expectation: XCTestExpectation?
    
    static func addCharacterListOnWindow(window: UIWindow) {}
    
    func pushCharacterCreation() {
        expectation?.fulfill()
    }
    
}

