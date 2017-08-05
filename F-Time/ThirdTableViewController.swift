//
//  ThirdTableViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ThirdTableViewController: UITableViewController ,NSFetchedResultsControllerDelegate{
    
    var things:[Things]!
    
    var fc : NSFetchedResultsController<Things>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundView = UIImageView.init(image:UIImage(named: "newbackground"))
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        fetchAllData2()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
        let content = UNMutableNotificationContent()
        content.title = ""
        content.subtitle = ""
        content.body = "body triggered"
        
        //        let trigger2 = UNCalendarNotificationTrigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//        things = getThings()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func fetchAllData2(){
        let request:NSFetchRequest<Things> = Things.fetchRequest()
        let sd = NSSortDescriptor(key:"name",ascending: false) //排序规则
        request.sortDescriptors = [sd]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //初始化
        fc = NSFetchedResultsController(fetchRequest: request , managedObjectContext: context, sectionNameKeyPath:  nil, cacheName: nil  )
        fc.delegate = self
        
        do {
            try fc.performFetch()
            if let objects = fc.fetchedObjects{
                things = objects
            }
            
        } catch  {
            print(error)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return things.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdCell", for: indexPath) as! ThirdTableViewCell
        let str = things[indexPath.row].name! + "\n" + String(things[indexPath.row].thingID)
        cell.thingLabel.text = str
        // Configure the cell...

        return cell
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()//单元格更新
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    //单元格~数据每条 变化
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        //执行操作
        switch type
        {
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
            
        default:
            tableView.reloadData()
        }
        //数据源变化时同步到数组
        if let object = controller.fetchedObjects{
            things = object as! [Things]
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //自定义右滑菜单
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath)  -> [UITableViewRowAction]? {
        let actionDel = UITableViewRowAction(style: .default, title: "删除")
        {
            (_, indexPath) in
            let operate = HandleCoreData()
            operate.deleteData(ID: Int(self.things[indexPath.row].thingID))
//            self.things.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)//即时刷新 删除一行
        }
        return [actionDel]
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let dest1 = segue.destination as! UINavigationController
            let dest2 = dest1.topViewController as! DetailTableViewController
            dest2.thing = things[tableView.indexPathForSelectedRow!.row]
        }
        
    }


    func getThings( ) -> [Things] {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        //声明数据的请求
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        //        fetchRequest.fetchLimit = 10  //限制查询结果的数量
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        //声明一个实体结构
        let EntityName = "Things"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
        
        let things:[Things]
        
        //设置查询条件
        //        ?let predicate = NSPredicate.init(format: "userID = '2'", "")
        //        fetchRequest.predicate = predicate
        
        //查询操作
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as! [Things]
            things = fetchedObjects
        }catch {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
        return things
    }
    
    @IBAction func detailUnwindToThird (segue: UIStoryboardSegue) {
        
    }
}
