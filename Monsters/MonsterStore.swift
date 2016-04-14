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
    
    
    var monsters = [Monster]()
    var monstersAlphabetical = ["A":[Monster](), "B ":[Monster]()]
    var count: Int { get { return monsters.count } }
    
    func monsterAtIndex(index: Int) -> Monster {
        return monsters[index]
    }
    
    func monsterNameAtIndex(index: Int) -> String {
        return monsters[index].name
    }
    
    
    
    
    
    
    let jsonStr =  "[{\"desc\":{\"name\":\"Bugbear\", \"size\":\"Medium\", \"type\":\"Humanoid\", \"subtype\":\"goblinoid, alignment:chaotic evil\"},\"capabilities\": {\"ac\":16, \"armor\":\"hide armor, shield\", \"hp\":17, \"hd\":\"5d8+5\", \"speed\":30},\"abilities\": {\"str\":15, \"dex\":14, \"con\":13, \"int\":8, \"wis\":11, \"cha\":9},\"skills\":{\"skills\":[\"stealth +6\", \"Survival +2\"],\"senses\":[\"darkvision 60ft.\", \"passive perception 10\"],\"languages\":[\"common\", \"goblin\"],\"cr\":1,\"xp\":200},\"features\":[\"Brute: ...\", \"Surprise: ...\"],\"actions\":[\"Morningstar: ...\", \"Javelin: ...\"]}]"
    
    func testJSON() -> Monster {
        let data = jsonStr.dataUsingEncoding(NSUTF8StringEncoding)
        let json = JSON(data: data!)
        
        return makeMonsterFromJSON(json)!
    }
    
    
    func makeMonsterFromJSON(json: JSON) -> Monster? {
        // print(json[0])
        // print(json[0]["desc"])
        
        // Description
        let name = json["desc"]["name"].string
        let size = json["desc"]["size"].string
        let type = json["desc"]["type"].string
        let subtype = json["desc"]["subtype"].string
        // TODO: Add alignment to JSON
        // let alignment = json[0]["desc"]["alignment"].string
        
        print(name)
        print(size)
        
        let theSize = MonsterSize(rawValue: size!.capitalizedString)
        let theType = MonsterType(rawValue: type!.capitalizedString)
        
        // Capabilities
        let ac = json["capabilities"]["ac"].int
        let armor = json["capabilities"]["armor"].string
        let hp = json["capabilities"]["hp"].int
        let hd = json["capabilities"]["hd"].string
        let speed = json["capabilities"]["speed"].int
        
        // Abilities
        let str = json["abilities"]["str"].int!
        let dex = json["abilities"]["dex"].int!
        let con = json["abilities"]["con"].int!
        let int = json["abilities"]["int"].int!
        let wis = json["abilities"]["wis"].int!
        let cha = json["abilities"]["cha"].int!
        
        let attributes = Attributes(str: str, dex: dex, con: con, int: int, wis: wis, cha: cha)
        
        
        
        // Skills & Senses
        let skillsArray = json["skills"]["skills"]
        var skills = [String]()
        for skill in skillsArray {
            skills.append(skill.1.string!)
        }
        
        // Senses
        let senseArray = json["skills"]["senses"]
        var senses = [String]()
        for sense in senseArray {
            senses.append(sense.1.string!)
        }
        
        // Languages
        let langArray = json["skills"]["languages"]
        var languages = [String]()
        for language in langArray {
            languages.append(language.1.string!)
        }
        
        // CR & XP
        let cr = json["skills"]["cr"].int // TODO: Convert to Double to show fraction CRs
        let xp = json["skills"]["xp"].int
        
        // Features
        let featuresArray = json["features"]
        var features = [String]()
        for feature in featuresArray {
            features.append(feature.1.string!)
        }
        
        // Actions
        let actionsArray = json["actions"]
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
    
    func loadMonsters() {
        let jsonStr = getJSON()
        let data = jsonStr.dataUsingEncoding(NSUTF8StringEncoding)
        let json = JSON(data: data!)
        let n = json.count
        for i in 0 ..< n {
            if let monster = makeMonsterFromJSON(json[i]) {
                monsters.append(monster)
            }
            
        }
    }
    
    func getJSON() -> String {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("monster", ofType: "json")
        do {
            let json = try String(contentsOfFile: path!)
            return json
        } catch let error {
            print(error)
        }
        
        return ""
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


