//
//  ContactsVC.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {
    
    @IBOutlet weak var contactsTable:UITableView!
    var contacts = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTable.delegate = self
        contactsTable.dataSource = self
        
        APIClient.sharedInstance.getData { (data, responseCode, error) in
            if data != nil {
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.contacts = data!
                    self.contactsTable.reloadData()
                })
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addContacts" {
            let addContactsVC = segue.destinationViewController as! AddContactsVC
            addContactsVC.delegate = self
        }
    }
}

// MARK:- UITableViewDelegate methods

extension ContactsVC: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
}

// MARK: - UITableViewDatasource methods

extension ContactsVC: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerNib(UINib.init(nibName: "CustomContactsCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CustomContactsCell {
            cell.configCell(contacts[indexPath.row])
            return cell
        } else {
            let cell = CustomContactsCell()
            cell.configCell(contacts[indexPath.row])
            return cell
        }
    }
}

extension ContactsVC: writeValueBackDelegate {
    func getAddedContact(person: Person) {
        contacts.append(person)
        contactsTable.reloadData()
    }
}