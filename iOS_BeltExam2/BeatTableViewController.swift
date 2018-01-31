//
//  ViewController.swift
//  iOS_BeltExam2
//
//  Created by Chao-I Chen on 1/30/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit
import CoreData

class BeatTableViewController: UITableViewController, AddItemDelegate {
    var Events: [List] = []
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func beatButtonPressed(_ sender: UIButton) {
        if let cell = sender.superview?.superview as? MyCell {
            let indexPath = tableView.indexPath(for: cell)
            let beat = Events[indexPath!.row]
            beat.beat = true
            beat.date = Date()
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
            fetchAll()
        }
    }
    
    func itemSaved(by controller: AddItemViewController, with text: String, with index: IndexPath?) {
        if let idx = index {
            let cell = Events[idx.row]
            cell.title = text
        }else{
            let newItem = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedObjectContext) as! List
            newItem.title = text
            newItem.beat = false
        }
        
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        fetchAll()
        
        dismiss(animated: true, completion: nil)
    }
    
    func itemCancle(by controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Add", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let half_dest = segue.destination as! UINavigationController
        let destination = half_dest.topViewController as! AddItemViewController
        destination.delegate = self
        
        if let indexPath = sender as? IndexPath{
            let event = Events[indexPath.row]
            destination.titleString = event.title
            destination.index = indexPath
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        let beat = Events[indexPath.row]
        
        cell.titleLabel?.text = beat.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Events.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        oneTime()
        fetchAll()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchAll(){
        Events.removeAll()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "List")
        request.predicate = NSPredicate(format: "beat = %@", false as CVarArg)
        do{
            let result = try managedObjectContext.fetch(request)
            Events = result as! [List]
            tableView.reloadData()
        }
        catch{
            print("\(error)")
        }
        
    }
    
    func oneTime(){
        let newItem1 = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedObjectContext) as! List
        newItem1.title = "Retil 1"
        newItem1.beat = false
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        
        let newItem2 = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedObjectContext) as! List
        newItem2.title = "Retil 2"
        newItem2.beat = false
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        
        let newItem3 = NSEntityDescription.insertNewObject(forEntityName: "List", into: managedObjectContext) as! List
        newItem3.title = "Retil 3"
        newItem3.beat = false
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
}

