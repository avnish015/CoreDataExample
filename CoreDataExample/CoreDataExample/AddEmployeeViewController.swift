//
//  AddEmployeeViewController.swift
//  CoreDataExample
//
//  Created by avnish kumar on 19/06/17.
//  Copyright © 2017 avnish kumar. All rights reserved.
//

import Cocoa

class AddEmployeeViewController: NSViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var idTextView: NSTextField!
    @IBOutlet weak var nameTextView: NSTextField!
    @IBOutlet weak var contactNoTextFiled: NSTextField!
    
    //MARK:- Properties
    let context = (NSApplication.shared().delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    //MARK:- IBActions
    @IBAction func addEmployee(_ sender: NSButton) {
        if contactNoTextFiled.stringValue != Constants.emptyString && nameTextView.stringValue != Constants.emptyString && idTextView.stringValue != Constants.emptyString {
            let employee = Employee(context: context)
            employee.contactNumber = contactNoTextFiled.stringValue
            employee.name = nameTextView.stringValue
            employee.id = idTextView.stringValue
            context.perform {
                do {
                    try self.context.save()
                }catch {
                    print(error)
                }
            }
        }
        self.dismissViewController(self)
    }
}

