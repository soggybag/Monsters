//
//  ViewController.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    // MARK: IBOutlets 
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    // MARK: TableView methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MonsterStore.sharedInstance.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = MonsterStore.sharedInstance.monsterNameAtIndex(indexPath.row)
        
        return cell
    }
    
    
    
    
    // MARK: Navigation 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMonsterSegue" {
            let vc = segue.destinationViewController as! MonsterViewController
            let indexPath = tableView.indexPathForSelectedRow
            vc.monster = MonsterStore.sharedInstance.monsterAtIndex(indexPath!.row)
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // MonsterStore.sharedInstance.testJSON()
        // MonsterStore.sharedInstance.getJSON()
        MonsterStore.sharedInstance.loadMonsters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

