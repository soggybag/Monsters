//
//  Attibutes.swift
//  Monsters
//
//  Created by mitchell hudson on 4/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation

struct Attributes {
    let str: Int
    var strBonus: Int { get { return calculateBonus(str) } }
    var strStr: String { get { return "\(str)(\(calculateBonusString(str)))" } }
    
    let dex: Int
    var dexBonus: Int { get { return calculateBonus(dex) } }
    var dexStr: String { get { return "\(dex)(\(calculateBonusString(dex)))" } }
    
    let con: Int
    var conBonus: Int { get { return calculateBonus(con) } }
    var conStr: String { get { return "\(con)(\(calculateBonusString(con)))" } }
    
    let int: Int
    var intBonus: Int { get { return calculateBonus(int) } }
    var intStr: String { get { return "\(int)(\(calculateBonusString(int)))" } }
    
    let wis: Int
    var wisBonus: Int { get { return calculateBonus(wis) } }
    var wisStr: String { get { return "\(wis)(\(calculateBonusString(wis)))" } }
    
    let cha: Int
    var chaBonus: Int { get { return calculateBonus(cha) } }
    var chaStr: String { get { return "\(cha)(\(calculateBonusString(cha)))" } }
    
    private func calculateBonus(attr: Int) -> Int {
        return (attr - 10) / 2
    }
    
    private func calculateBonusString(attr: Int) -> String {
        let n = (attr - 10) / 2
        if n > 0 {
            return "+\(n)"
        }
        return "\(n)"
    }
    
}