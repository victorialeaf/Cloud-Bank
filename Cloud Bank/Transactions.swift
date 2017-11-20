//
//  Transactions.swift
//  Cloud Bank
//
//  Created by Victoria Leaf on 11/19/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class Transactions: UIViewController {


    @IBOutlet weak var TransactionsTableView: UITableView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelVendor: UILabel!
    @IBOutlet weak var labelAmount: UILabel!
    
    var refDates: DatabaseReference!
    var refVendors: DatabaseReference!
    var refAmounts: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()

        refTransactions = FIRDatabase().reference().child("accounts");
        refTransactions.observe(FIRDataEventType.value, with { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.transactionList.removeAll()
                
                for transactions in snapshot.children.allObjects as! [FIRDataSnapshot] {
                    let transactionObject = transactions.value as? [String: AnyObject]
                    let transactionDate = transactionObject? ["date"]
                    let transactionVendor = transactionObject?["vendor"]
                    let transactionAmount = transactionObject?["amount"]
                    let transaction = TransactionModel(date: transactionDate as! String?, name: transactionVendor as! String?, amount: TransactionAmount as! String?)
                    self.transactionList.append(transaction)
                }
                self.tableViewTransactions.reloadData()
            }
        })
    }
    //defining firebase ref var
    var transactionList = [TransactionModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionsTableViewCell
        let transaction = TransactionModel
        transaction = TransactionModel[indexPath.row]
        
        cell.labelDate.text = transaction.date
        cell.labelVendor.text = transaction.vendor
        cell.labelAmount.text = transaction.amount
        
        return cell
    }
    
   
   
    
    
    //func tableView(_tableView: UITableView, numberOfRowsInSection: Int) -> Int {
    //    return transdate.count
   // }
  //  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     //   let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
     //   cell.textLabel?.text = transdate[indexPath.row]
        
       // return cell
        
    }//
    

    //override func didReceiveMemoryWarning() {
      //  super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   // }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


