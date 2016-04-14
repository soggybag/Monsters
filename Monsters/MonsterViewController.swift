//
//  MonsterViewController.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit


class MonsterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let monster = MonsterStore.sharedInstance.testJSON()
    
    let sections = [
        "Name, type, and alignment",
        "AC, HP, and Speed",
        "Attributes",
        "Skills",
        "Special abilities",
        "Actions"]
    
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: TableView Methods 
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return monster.skillsSnesesLanguagesShort.count
        case 4:
            return monster.features.count
        case 5:
            return monster.actions.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellId = "cell"
        if indexPath.section == 2 {
            cellId = "attributesCell"
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId)!
        
        switch indexPath.section {
        case 0:
            // Get name, type ...
            cell.textLabel?.text = monster.name
            cell.detailTextLabel?.text = monster.descStr
        case 1:
            cell.textLabel?.text = monster.acHpSpeed[indexPath.row]
            
        case 2:
            let attributes = monster.attributes
            (cell as? AttributesTableViewCell)?.attributes = attributes
            
        case 3:
            cell.textLabel?.text = monster.skillsSnesesLanguagesShort[indexPath.row]
            
        case 4:
            cell.textLabel?.text = monster.features[indexPath.row]
            
        case 5:
            cell.textLabel?.text = monster.actions[indexPath.row]
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 60
        }
        
        return tableView.rowHeight
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
