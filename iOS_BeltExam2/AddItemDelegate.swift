//
//  AddItemDelegate.swift
//  iOS_BeltExam2
//
//  Created by Chao-I Chen on 1/30/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import Foundation

protocol AddItemDelegate: class {
    func itemSaved(by controller: AddItemViewController, with text: String, with index: IndexPath?)
    func itemCancle(by controller: AddItemViewController)
}
