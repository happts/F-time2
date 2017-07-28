//
//  SecondViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {

    @IBOutlet weak var todayNum: UILabel!
    
    var things:[Things]!
    
    func thingscalculate (day: Int) -> Int {
        
        var j = 0
        var c = 0
        var d = 0
        
        for i in things {
            
            let a = StringDateTransfer(dateStr: i.startTime!)
            let b = StringDateTransfer(dateStr: i.endTime!)
            c = dateTimeExtractive(date: a).day
            d = dateTimeExtractive(date: b).day

            if (c <= day) && (d >= day) {
                j += 1
            }
        }
        return j
    }
    
    func heightcalculate (day: Int) -> Int {
        
        var j = 0
        var c = 0
        var d = 0
        
        for i in things {
            
            let a = StringDateTransfer(dateStr: i.startTime!)
            let b = StringDateTransfer(dateStr: i.endTime!)
            c = dateTimeExtractive(date: a).day
            d = dateTimeExtractive(date: b).day
            
            if (c <= day) && (d >= day) {
                j += 1
            }
        }
        if j <= 10 {
            return j
        } else {
            return 1
        }
    }
    
    func datetoday () -> Int {
        let currentDate = Date()
        let currentDate2 = dateStringTranser(date: currentDate)
        let currentDate3 = StringDateTransfer(dateStr: currentDate2)
        return dateTimeExtractive(date: currentDate3).day
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        things = getThings()
        
        let today = datetoday()
        
        todayNum.text = String(thingscalculate(day: today))
        
        let view1 = UIView(frame: CGRect(x: 32, y: 445-16*heightcalculate(day: today), width: 23, height: 16*heightcalculate(day: today)))
        let view2 = UIView(frame: CGRect(x: 80, y: 445-16*heightcalculate(day: today+1), width: 23, height: 16*heightcalculate(day: today+1)))
        let view3 = UIView(frame: CGRect(x: 128, y: 445-16*heightcalculate(day: today+2), width: 23, height: 16*heightcalculate(day: today+2)))
        let view4 = UIView(frame: CGRect(x: 176, y: 445-16*heightcalculate(day: today+3), width: 23, height: 16*heightcalculate(day: today+3)))
        let view5 = UIView(frame: CGRect(x: 224, y: 445-16*heightcalculate(day: today+4), width: 23, height: 16*heightcalculate(day: today+4)))
        let view6 = UIView(frame: CGRect(x: 272, y: 445-16*heightcalculate(day: today+5), width: 23, height: 16*heightcalculate(day: today+5)))
        let view7 = UIView(frame: CGRect(x: 320, y: 445-16*heightcalculate(day: today+6), width: 23, height: 16*heightcalculate(day: today+6)))

        view1.backgroundColor = UIColor.white
        view2.backgroundColor = UIColor.white
        view3.backgroundColor = UIColor.white
        view4.backgroundColor = UIColor.white
        view5.backgroundColor = UIColor.white
        view6.backgroundColor = UIColor.white
        view7.backgroundColor = UIColor.white

        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        self.view.addSubview(view5)
        self.view.addSubview(view6)
        self.view.addSubview(view7)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    struct dateTime {
        var year: Int
        var month: Int
        var day: Int
        var hour: Int
        var minute: Int
        var second: Int
    }
    
    func dateTimeExtractive(date: Date) -> dateTime {
        let calendar = Calendar.current
        let a = calendar.component(Calendar.Component.year, from: date)
        let b = calendar.component(Calendar.Component.month, from: date)
        let c = calendar.component(Calendar.Component.day, from: date)
        let d = calendar.component(Calendar.Component.hour, from: date)
        let e = calendar.component(Calendar.Component.minute, from: date)
        let f = calendar.component(Calendar.Component.second, from: date)
        let datetime = dateTime(year: a, month: b, day: c, hour: d, minute: e, second: f)
        return datetime
    }
    
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
