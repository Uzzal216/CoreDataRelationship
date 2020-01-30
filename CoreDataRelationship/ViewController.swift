//
//  ViewController.swift
//  CoreDataRelationship
//
//  Created by Sabbir Hossain on 1/28/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
   // var continentData = ["Europe", "Asia", "Africa"]
    
    var types:[Type] = []
    var type = Type()

    override func viewDidLoad() {
        super.viewDidLoad()
        showAllTypes()
    
        //insertData()
    tableview.delegate = self
    tableview.dataSource = self
        
    }
    
    
    
    func insertData()
    {
        let name = "Sabbir with child"
        //print(name as Any)
        
        let type = Type(context: PersistenceService.context)
        type.name = name
        //type.age = age
        let subtype1 = Subtype(context: PersistenceService.context)
        subtype1.name = "Sabbir Subtype 1"
        let subtype2 = Subtype(context: PersistenceService.context)
        subtype2.name = "Sabbir Subtype 2"
        type.addToHelper(subtype1)
        type.addToHelper(subtype2)
        
        PersistenceService.saveContext()
        print("From DB - ")
        showAllTypes()
    }
    
    
    
    func showAllTypes() {
        
        // textFieldString = ""
        let fetchRequest : NSFetchRequest<Type> = Type.fetchRequest()
        
        do {
            self.types = try PersistenceService.context.fetch(fetchRequest)
            print(self.types)
            for type in self.types
            {
                print(type.name)
            }
            //self.type = type
            //        for item in type {
            //            print("Name: \(item.name as Any) \nAge: \(item.name as Any)")
            //
            //            // Appending to the string
            //            //self.textFieldString += "Name: " + item.name! + ": " + "Age: " + String(item.age) + "\n"
            //        }
            
            // Show in textview
            //  showDataTextView.text = textFieldString
            
        } catch {
            print("Failed to fetch")
        }
    }

}


// Function for fetching and showing data


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "continentCell", for: indexPath )
       cell.textLabel?.text = types[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("Delete")
        }
    }
    
    
    //code for Showing in log
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // var rowNo = indexPath.row;
        //print(types[indexPath.row].name)
       self.type = types[indexPath.row]
      performSegue(withIdentifier: "Details", sender: self)
        
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
        if let detailsViewController = segue.destination as? DetailsViewController  {
           print(self.type.name)
           detailsViewController.type = self.type
        }
    }
    


}
