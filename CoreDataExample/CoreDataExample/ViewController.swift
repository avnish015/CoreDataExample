//
//  ViewController.swift
//  CoreDataExample
//
//  Created by avnish kumar on 16/06/17.
//  Copyright © 2017 avnish kumar. All rights reserved.
//

import Cocoa
import CoreData



class ViewController: NSViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var arrayController: NSArrayController!
    
    //MARK:- Properties
    let context = (NSApplication.shared().delegate as! AppDelegate).persistentContainer.viewContext
    
     //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    //MARK:- IBActions
    @IBAction func addButtonClicked(_ sender: NSToolbarItem) {
        
        self.performSegue(withIdentifier: Constants.addEmployee, sender: self)
    }
    
    @IBAction func deleteButtonClicked(_ sender: NSToolbarItem) {
        
        for index in arrayController.selectionIndexes {
            
            arrayController.remove(atArrangedObjectIndex: index)
            do{
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func searchedBarTextDidChange(_ sender: NSSearchField) {
        //Searches the table view records as per the given search string based on id, name, contact no.
        let searchString = sender.stringValue
        let predicate = NSPredicate(format: "id contains[c] %@ OR name contains[c] %@ OR contactNumber contains[c] %@", searchString, searchString, searchString)
        
        if searchString != Constants.emptyString{
            self.arrayController.filterPredicate = predicate
        } else{
            self.arrayController.filterPredicate = nil
        }
        self.tableView.reloadData()
    }
}

