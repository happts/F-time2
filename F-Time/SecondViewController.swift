//
//  SecondViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,NSFetchedResultsControllerDelegate {

    @IBOutlet weak var todayNum: UILabel!
    
    @IBOutlet weak var stackV: UIStackView!
    @IBOutlet weak var seventhV: UILabel!
    @IBOutlet weak var sixthV: UILabel!
    @IBOutlet weak var fifthV: UILabel!
    @IBOutlet weak var fourthV: UILabel!
    @IBOutlet weak var thirdV: UILabel!
    @IBOutlet weak var firstV: UILabel!
    @IBOutlet weak var secondV: UILabel!
    
    var fc : NSFetchedResultsController<Things>!
    
    var things:[Things]!
    
    var OD = operateDate()
    
    func thingscalculate (day: Int) -> Int {
        
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = OD.dateTimeExtractive(date: currentDate).hour
        let minute = OD.dateTimeExtractive(date: currentDate).minute
        let currentDate1 = calendar.date(byAdding: .hour, value: -hour, to: currentDate)
        let currentDate2 = calendar.date(byAdding: .minute, value: -minute, to: currentDate1!)
        
        var dateArray = Array(repeatElement(currentDate2, count: 8))
        
        for i in 0..<8 {
            dateArray[i] = calendar.date(byAdding: .day, value: 1*i, to: currentDate2!)
        }
        
        var j = 0
        
        for i in 0..<things.count {
            
            let a = things[i].startTime!
            let b = things[i].endTime!

            if !((a.compare(dateArray[day+1]!) == ComparisonResult.orderedDescending) || (b.compare(dateArray[day]!) == ComparisonResult.orderedAscending)) {
                j += 1
            }
        }
        return j
    }
    
    func heightcalculate (day: Int) -> Int {
        
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = OD.dateTimeExtractive(date: currentDate).hour
        let minute = OD.dateTimeExtractive(date: currentDate).minute
        let currentDate1 = calendar.date(byAdding: .hour, value: -hour, to: currentDate)
        let currentDate2 = calendar.date(byAdding: .minute, value: -minute, to: currentDate1!)
        
        var dateArray = Array(repeatElement(currentDate2, count: 8))
        
        for i in 0..<8 {
            dateArray[i] = calendar.date(byAdding: .day, value: 1*i, to: currentDate2!)
        }
        
        var j = 0
        
        for i in 0..<things.count {
            
            let a = things[i].startTime! as Date
            let b = things[i].endTime! as Date
            
            if !((a.compare(dateArray[day+1]!) == ComparisonResult.orderedDescending) || (b.compare(dateArray[day]!) == ComparisonResult.orderedAscending)) {
                j += 1
            }
        }
        
        if j <= 10 {
            return j
        } else {
             return 10
        }
    }
    
    func addView(){
        
        todayNum.text = String(thingscalculate(day: 0))
        
        let view1 = UIView(frame: CGRect(x: Int(firstV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 0)))
        let view2 = UIView(frame: CGRect(x: Int(secondV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 1)))
        let view3 = UIView(frame: CGRect(x: Int(thirdV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 2)))
        let view4 = UIView(frame: CGRect(x: Int(fourthV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 3)))
        let view5 = UIView(frame: CGRect(x: Int(fifthV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 4)))
        let view6 = UIView(frame: CGRect(x: Int(sixthV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 5)))
        let view7 = UIView(frame: CGRect(x: Int(seventhV.frame.origin.x)+5, y: Int(stackV.frame.origin.y)-10, width: 23, height: -16*heightcalculate(day: 6)))
        
        view1.backgroundColor = UIColor.white
        view2.backgroundColor = UIColor.white
        view3.backgroundColor = UIColor.white
        view4.backgroundColor = UIColor.white
        view5.backgroundColor = UIColor.white
        view6.backgroundColor = UIColor.white
        view7.backgroundColor = UIColor.white
        
        view1.tag = 1
        view2.tag = 2
        view3.tag = 3
        view4.tag = 4
        view5.tag = 5
        view6.tag = 6
        view7.tag = 7
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        self.view.addSubview(view5)
        self.view.addSubview(view6)
        self.view.addSubview(view7)

    }
    // MARK: 系统
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        things = getThings()
        fetchAllData2()
        addView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        for view in self.view.subviews{
            if view.tag >= 1{
                view.removeFromSuperview()
            }
        }
        addView()
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        //数据源变化时同步到数组
        if let object = controller.fetchedObjects{
            things = object as! [Things]
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        

}
