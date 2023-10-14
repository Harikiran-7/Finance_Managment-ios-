//
//  User.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 12/10/23.
//

import Foundation

struct User {
    var username: String
    var password: String
    var transactions: [Transaction]  // Assuming you have a Transaction struct

//    init(username: String, password: String, transactions: [Transaction]) {
//        self.username = username
//        self.password = password
//        self.transactions = transactions
//    }
}

struct Transaction {
    var amount: Int
    var description: String
}
