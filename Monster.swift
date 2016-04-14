//
//  Monster.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation


struct Monster {
    
    // Description
    let name: String
    let size: MonsterSize
    let type: MonsterType
    var descStr: String { get { return "\(size) \(type) subtype alignment" } }
    let subtype: String
    
    // Attributes
    let attributes: Attributes
    
    // Capabilities
    let ac: Int
    var acStr: String { get { return "Armor Class:\(ac) (\(armor))" } }
    let armor: String
    let hp: Int
    let hd: String
    var hpStr: String { get { return "Hit points:\(hp)(\(hd))" } }
    let speed: Int
    var speedStr: String { get{ return "\(speed)ft." } }
    var acHpSpeed: [String] { get {return [acStr, hpStr, speedStr]}}
    
    // Skills, Senses, & Languages
    let skills: [String]
    let senses: [String]
    let languages: [String]
    var skillsSensesLanguages: [String] {get{return skills + senses + languages}}
    var skillsSnesesLanguagesShort: [String] {
        get{
            return [skills.joinWithSeparator(", "), senses.joinWithSeparator(", "), languages.joinWithSeparator(", "), "CR:\(cr) XP:\(xp)"]
        }
    }
    
    let cr: Int
    let xp: Int
    
    // Features
    let features: [String]
    
    // Actions
    let actions: [String]

    
}







