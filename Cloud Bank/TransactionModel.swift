//
//  TransactionModel.swift
//  Cloud Bank
//
//  Created by Victoria Leaf on 11/19/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit

class TransactionModel {

    var date: String?
    var vendor: String?
    var amount: String?
    
    init(date: String?, vendor: String?, amount: String?){
        self.date = date
        self.vendor = vendor
        self.amount = amount
    }

}
