//
//  AddItemViewController.swift
//  iOS_BeltExam2
//
//  Created by Chao-I Chen on 1/30/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit

class Add_ItemViewController: UIViewController {

    weak var delegate: AddItemDelegate?
    
    @IBAction func canclePressed(_ sender: UIButton) {
        delegate?.itemCancle(by: self)
    }
    @IBAction func savePressed(_ sender: UIButton) {
//        delegate?.itemSaved(by: self, with, text: String,with date: Date, and index: IndexPath?)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
