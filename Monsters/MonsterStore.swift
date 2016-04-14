//
//  MonsterStore.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation

class MonsterStore {
    static let sharedInstance = MonsterStore()
    private init() {}
    
    
    let jsonStr =  "[{\"desc\":{\"name\":\"Bugbear\", \"size\":\"Medium\", \"type\":\"Humanoid\", \"subtype\":\"goblinoid, alignment:chaotic evil\"},\"capabilities\": {\"ac\":16, \"armor\":\"hide armor, shield\", \"hp\":17, \"hd\":\"5d8+5\", \"speed\":30},\"abilities\": {\"str\":15, \"dex\":14, \"con\":13, \"int\":8, \"wis\":11, \"cha\":9},\"skills\":{\"skills\":[\"stealth +6\", \"Survival +2\"],\"senses\":[\"darkvision 60ft.\", \"passive perception 10\"],\"languages\":[\"common\", \"goblin\"],\"cr\":1,\"xp\":200},\"features\":[\"Brute: ...\", \"Surprise: ...\"],\"actions\":[\"Morningstar: ...\", \"Javelin: ...\"]}]"
    
    func testJSON() -> Monster {
        let data = jsonStr.dataUsingEncoding(NSUTF8StringEncoding)
        let json = JSON(data: data!)
        // print(json[0])
        // print(json[0]["desc"])
        
        // Description
        let name = json[0]["desc"]["name"].string
        let size = json[0]["desc"]["size"].string
        let type = json[0]["desc"]["type"].string
        let subtype = json[0]["desc"]["subtype"].string
        // TODO: Add alignment to JSON
        // let alignment = json[0]["desc"]["alignment"].string
        let theSize = MonsterSize(rawValue: size!.capitalizedString)
        let theType = MonsterType(rawValue: type!.capitalizedString)
        
        // Capabilities
        let ac = json[0]["capabilities"]["ac"].int
        let armor = json[0]["capabilities"]["armor"].string
        let hp = json[0]["capabilities"]["hp"].int
        let hd = json[0]["capabilities"]["hd"].string
        let speed = json[0]["capabilities"]["speed"].int
        
        // Abilities
        let str = json[0]["abilities"]["str"].int!
        let dex = json[0]["abilities"]["dex"].int!
        let con = json[0]["abilities"]["con"].int!
        let int = json[0]["abilities"]["int"].int!
        let wis = json[0]["abilities"]["wis"].int!
        let cha = json[0]["abilities"]["cha"].int!
        
        let attributes = Attributes(str: str, dex: dex, con: con, int: int, wis: wis, cha: cha)
        
        
        
        // Skills & Senses
        let skillsArray = json[0]["skills"]["skills"]
        var skills = [String]()
        for skill in skillsArray {
            skills.append(skill.1.string!)
        }
        
        // Senses
        let senseArray = json[0]["skills"]["senses"]
        var senses = [String]()
        for sense in senseArray {
            senses.append(sense.1.string!)
        }
        
        // Languages
        let langArray = json[0]["skills"]["languages"]
        var languages = [String]()
        for language in langArray {
            languages.append(language.1.string!)
        }
        
        // CR & XP
        let cr = json[0]["skills"]["cr"].int
        let xp = json[0]["skills"]["xp"].int
        
        // Features
        let featuresArray = json[0]["features"]
        var features = [String]()
        for feature in featuresArray {
            features.append(feature.1.string!)
        }
        
        // Actions 
        let actionsArray = json[0]["actions"]
        var actions = [String]()
        for action in actionsArray {
            actions.append(action.1.string!)
        }
        
        let m = Monster(
            name: name!,
            size: theSize!,
            type: theType!,
            subtype: subtype!,
            attributes: attributes,
            ac: ac!,
            armor: armor!,
            hp: hp!,
            hd: hd!,
            speed: speed!,
            skills:skills,
            senses: senses,
            languages: languages,
            cr: cr!,
            xp: xp!,
            features: features,
            actions: actions
        )
        
        return m
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func getJSON() {
        
        let path = fileInDocumentsDirectory("monster.json")
        print(path)
        do {
            let str = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            print(str)
        } catch let error {
            print(error)
        }
    }
    
    func getDocumentsURL() -> NSURL {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsURL
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
        return fileURL.path!
    }
    
}


