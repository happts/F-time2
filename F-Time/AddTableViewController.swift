//
//  AddTableViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    var thing:Things!
    var pickerDT = false
    
    
    @IBOutlet weak var startWeek: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var startTime: UILabel!

    @IBOutlet weak var thingNameText: UITextField!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var endWeek: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    @IBAction func thingButtonTap(_ sender: UIButton) {
        
    }
    @IBAction func dailyButtonTap(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var timeAnddate = "1"
        if indexPath.row <= 1{
            
            let actionSheet = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message:  nil, preferredStyle:.actionSheet)
            
            let option4 = UIDatePicker()
            option4.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
            option4.datePickerMode = (pickerDT) ? UIDatePickerMode.time : UIDatePickerMode.date
            option4.date = Date()
            
            var title: String
            if pickerDT {
                title = "确定时间"
            }else{
                title = "确定日期"
            }
            
            let option5 = UIAlertAction(title: title, style: .default, handler: { (_) in
                self.pickerDT = !self.pickerDT
                
//                let dFormatter = DateFormatter()
//                dFormatter.dateFormat = "yyyy年MM月dd日HH时mm"
                timeAnddate = self.dateStringTranser(date: option4.date)
                print(timeAnddate)
            })
            actionSheet.view.addSubview(option4)
            actionSheet.addAction(option5)
            
            self.present(actionSheet, animated: true, completion: nil)
            

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: 数据处理函数
    func dateStringTranser(date:Date) -> String {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "yyyy年MM月dd日HH时mm"
        return dFormatter.string(from: date)
    }

}
