//
//  TESTViewController.swift
//  iOS_BeltExam2
//
//  Created by Chao-I Chen on 1/30/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    var titleString: String?
    var index: IndexPath?
    
    @IBOutlet weak var textField: UITextField!
    weak var delegate: AddItemDelegate?
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        delegate?.itemSaved(by: self, with: textField.text!, with: index)
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        delegate?.itemCancle(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if index != nil{
            textField.text = titleString
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
