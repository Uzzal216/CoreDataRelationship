//
//  DetailsViewController.swift
//  CoreDataRelationship
//
//  Created by Sabbir Hossain on 1/29/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit
import CoreData


class DetailsViewController: UIViewController{
    
     var type = Type()
    var subtype = Subtype()
    
      @IBOutlet weak var tblview: UITableView!
    
        var numberofrow :Int = 0
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("name :" + type.name!)
        print(type.helper)
        tblview.delegate = self
        tblview.dataSource = self
    
    }
    
    
    
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberofrow = type.helper?.allObjects.count ?? 0
        return numberofrow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        cell.textLabel?.text = (type.helper?.allObjects[indexPath.row] as! Subtype).name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            subtype = type.helper!.allObjects[indexPath.row] as! Subtype
            type.removeFromHelper(subtype)
            PersistenceService.saveContext()
            print("Delete")
            self.tblview.reloadData()
            
        }
    }
}
