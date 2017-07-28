//
//  AddTableViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit
import CoreData

class AddTableViewController: UITableViewController {
    
    var operate = HandleCoreData()
    
    var thing:Things!
    var pickerDT = false	
    var startDateStr:String!
    var endDateStr:String!
    var dailyOrNot = false
    
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var thingNameText: UITextField!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var thingRemarkText: UITextField!
    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var dailyButton0: UIButton!
    
    @IBAction func dailyOrNotTextButton(_ sender: UIButton) {
        if sender.tag == 1 {
            dailyOrNot = true
            dailyButton.setImage(UIImage(named: "dailyselect1"), for: .normal)  
            dailyButton0.setImage(UIImage(named: "dailyselect20"), for: .normal)
            
        } else {
            dailyOrNot = false
            dailyButton.setImage(UIImage(named: "dailyselect10"), for: .normal)
            dailyButton0.setImage(UIImage(named: "dailyselect2"), for: .normal)
        }
    }

    
    @IBAction func saveTap(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //获取本 AppDelegate
        
        let countID = UserDefaults.standard
        var thingID = countID.integer(forKey: "ID")
        thingID+=1
        countID.set(thingID, forKey: "ID")
        print(thingID)
        thing = Things(context: appDelegate.persistentContainer.viewContext)
        thing.thingID = Int64(thingID)
        thing.name = thingNameText.text
        thing.startTime = startDateStr
        thing.endTime = endDateStr
        thing.priority = dailyOrNot
        thing.remark = thingRemarkText.text
        appDelegate.saveContext()
        
        performSegue(withIdentifier: "unwindToFirst", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        thingNameText.borderStyle = UITextBorderStyle.none
        thingRemarkText.borderStyle = UITextBorderStyle.none
        
        self.tableView.backgroundView = UIImageView.init(image:UIImage(named: "newerbackground"))
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        startDateStr = dateStringTranser(date: Date())
        endDateStr = startDateStr
        StartDate.text = startDateStr
        endDate.text = startDateStr
        
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
        //时间选择器-完成( UI 可简化)
        if indexPath.row == 3 || indexPath.row == 5 {
            
            let actionSheet = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message:  nil, preferredStyle:.actionSheet)
            
            let option4 = UIDatePicker()
            option4.locale = NSLocale(localeIdentifier: "zh_CN") as Locale
            option4.datePickerMode = (pickerDT) ? UIDatePickerMode.time : UIDatePickerMode.date
            option4.date = indexPath.row==3 ? StringDateTransfer(dateStr: startDateStr) : StringDateTransfer(dateStr: endDateStr)
            
            var title: String
            if pickerDT {
                title = "确定时间"
            }else{
                title = "确定日期"
            }
            
            let option5 = UIAlertAction(title: title, style: .default, handler: { (_) in
                self.pickerDT = !self.pickerDT
                
                if indexPath.row == 3{
                    self.startDateStr = self.dateStringTranser(date: option4.date)
                    self.StartDate.text = self.startDateStr
                }
                else if indexPath.row == 5{
                    self.endDateStr = self.dateStringTranser(date: option4.date)
                    self.endDate.text = self.endDateStr
                }
                
                print(self.startDateStr ,"\n", self.endDateStr)
                
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
        dFormatter.locale = Locale.current
        return dFormatter.string(from: date)
    }
    
    func StringDateTransfer(dateStr:String) -> Date {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "yyyy年MM月dd日HH时mm"
        dFormatter.locale = Locale.current
        return dFormatter.date(from: dateStr)!
    }

}
