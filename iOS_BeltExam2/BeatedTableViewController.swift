//
//  BeatedTableViewController.swift
//  iOS_BeltExam2
//
//  Created by Chao-I Chen on 1/30/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit
import CoreData

class BeatedTableViewController: UITableViewController {
    var Events: [List] = []
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAll()
        viewWillAppear(true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeatedCell", for: indexPath) 
        let formatter = DateFormatter()
        
        let beat = Events[indexPath.row]
        formatter.dateFormat = "MM/DD/YY eeee"
        cell.textLabel?.text = beat.title
        if beat.date != nil{
            cell.detailTextLabel?.text = formatter.string(from: beat.date!)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Events.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func fetchAll(){
        Events.removeAll()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "List")
        request.predicate = NSPredicate(format: "beat = %@", true as CVarArg)
        do{
            let result = try managedObjectContext.fetch(request)
            Events = result as! [List]
            tableView.reloadData()
        }
        catch{
            print("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
