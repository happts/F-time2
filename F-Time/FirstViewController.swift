//
//  FirstViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class FirstViewController: UIViewController {
    
    var things:[Things]!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var thing1Label: UILabel!
    @IBOutlet weak var thing2Label: UILabel!
    @IBOutlet weak var thing3Label: UILabel!
    @IBOutlet weak var image1View: UIImageView!
    @IBOutlet weak var image2View: UIImageView!
    @IBOutlet weak var image3View: UIImageView!
    @IBOutlet weak var image4View: UIImageView!
    @IBOutlet weak var image5View: UIImageView!
    @IBOutlet weak var image6View: UIImageView!
    @IBOutlet weak var image7View: UIImageView!
    @IBOutlet weak var image8View: UIImageView!
    @IBOutlet weak var image9View: UIImageView!
    @IBOutlet weak var image10View: UIImageView!
    @IBOutlet weak var image11View: UIImageView!
    @IBOutlet weak var image12View: UIImageView!
    @IBOutlet weak var image13View: UIImageView!
    @IBOutlet weak var image14View: UIImageView!
    @IBOutlet weak var image15View: UIImageView!
    @IBOutlet weak var image16View: UIImageView!
    @IBOutlet weak var image17View: UIImageView!
    @IBOutlet weak var image18View: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        things = getThings()
        
        let currentDate = Date()
        let hour = dateTimeExtractive(date: currentDate).hour
        let minute = dateTimeExtractive(date: currentDate).minute
        if minute < 10 {
            timeLabel.text = "\(hour):0\(minute)"
        }else{
            timeLabel.text = "\(hour):\(minute)"
        }
        
        var newthings = things
        func onSort(s1: Things, s2: Things) -> Bool{
            let a = StringDateTransfer(dateStr: s1.startTime!)
            let b = StringDateTransfer(dateStr: s2.startTime!)
            return a.compare(b) == ComparisonResult.orderedAscending
        }
        
        newthings?.sort(by: onSort)
        
        if things.count != 0{
            
            var index = newthings?.count
            
            for i in newthings! {
                let a = StringDateTransfer(dateStr: i.startTime!)
                let b = currentDate
                if !(a.compare(b) == ComparisonResult.orderedAscending) {
                    index = (newthings?.index(of: i))!
                    break
                }
            }
            
            if (newthings?.count)! - index! == 1 {
                thing1Label.text = newthings?[index!].name
                thing2Label.text = "暂无事项"
                thing3Label.text = "暂无事项"
            }else if (newthings?.count)! - index! == 2{
                thing1Label.text = newthings?[index!].name
                thing2Label.text = newthings?[index!+1].name
                thing3Label.text = "暂无事项"
            }else if (newthings?.count)! - index! >= 3{
                thing1Label.text = newthings?[index!].name
                thing2Label.text = newthings?[index!+1].name
                thing3Label.text = newthings?[index!+2].name
            }
        }

        let calendar = Calendar.current
        var dateArray = Array(repeatElement(currentDate, count: 19))
        
        
        for i in 0..<19 {
            dateArray[i] = calendar.date(byAdding: .minute, value: 10*i, to: currentDate)!
        }
        
        for i in dateArray {
            print(i)
        }
        
        image1View.image = UIImage(named: "小圆块块1")
        image2View.image = UIImage(named: "小圆块块2")
        image3View.image = UIImage(named: "小圆块块3")
        image4View.image = UIImage(named: "小圆块块4")
        image5View.image = UIImage(named: "小圆块块5")
        image6View.image = UIImage(named: "小圆块块6")
        image7View.image = UIImage(named: "小圆块块7")
        image8View.image = UIImage(named: "小圆块块8")
        image9View.image = UIImage(named: "小圆块块9")
        image10View.image = UIImage(named: "小圆块块10")
        image11View.image = UIImage(named: "小圆块块11")
        image12View.image = UIImage(named: "小圆块块12")
        image13View.image = UIImage(named: "小圆块块13")
        image14View.image = UIImage(named: "小圆块块14")
        image15View.image = UIImage(named: "小圆块块15")
        image16View.image = UIImage(named: "小圆块块16")
        image17View.image = UIImage(named: "小圆块块17")
        image18View.image = UIImage(named: "小圆块块18")
        
        
        for i in newthings! {
            let a = StringDateTransfer(dateStr: i.startTime!)
            let b = StringDateTransfer(dateStr: i.endTime!)
            if a.compare(dateArray[18]) == ComparisonResult.orderedDescending {
                continue
            }
            if b.compare(dateArray[0]) == ComparisonResult.orderedAscending {
                continue
            }
            if !((a.compare(dateArray[1]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[0]) == ComparisonResult.orderedAscending)) {
                image1View.image = UIImage(named: "小圆块块1")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[2]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[1]) == ComparisonResult.orderedAscending)) {
                image2View.image = UIImage(named: "小圆块块2")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[3]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[2]) == ComparisonResult.orderedAscending)) {
                image3View.image = UIImage(named: "小圆块块3")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[4]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[3]) == ComparisonResult.orderedAscending)) {
                image4View.image = UIImage(named: "小圆块块4")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[5]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[4]) == ComparisonResult.orderedAscending)) {
                image5View.image = UIImage(named: "小圆块块5")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[6]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[5]) == ComparisonResult.orderedAscending)) {
                image6View.image = UIImage(named: "小圆块块6")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[7]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[6]) == ComparisonResult.orderedAscending)) {
                image7View.image = UIImage(named: "小圆块块7")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[8]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[7]) == ComparisonResult.orderedAscending)) {
                image8View.image = UIImage(named: "小圆块块8")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[9]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[8]) == ComparisonResult.orderedAscending)) {
                image9View.image = UIImage(named: "小圆块块9")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[10]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[9]) == ComparisonResult.orderedAscending)) {
                image10View.image = UIImage(named: "小圆块块10")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[11]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[10]) == ComparisonResult.orderedAscending)) {
                image11View.image = UIImage(named: "小圆块块11")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[12]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[11]) == ComparisonResult.orderedAscending)) {
                image12View.image = UIImage(named: "小圆块块12")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[13]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[12]) == ComparisonResult.orderedAscending)) {
                image13View.image = UIImage(named: "小圆块块13")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[14]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[13]) == ComparisonResult.orderedAscending)) {
                image14View.image = UIImage(named: "小圆块块14")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[15]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[14]) == ComparisonResult.orderedAscending)) {
                image15View.image = UIImage(named: "小圆块块15")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[16]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[15]) == ComparisonResult.orderedAscending)) {
                image16View.image = UIImage(named: "小圆块块16")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[17]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[16]) == ComparisonResult.orderedAscending)) {
                image17View.image = UIImage(named: "小圆块块17")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            if !((a.compare(dateArray[18]) == ComparisonResult.orderedDescending) || (b.compare(dateArray[17]) == ComparisonResult.orderedAscending)) {
                image18View.image = UIImage(named: "小圆块块18")?.tint(color: UIColor(red: 194/255, green: 203/255, blue: 218/255, alpha: 1), blendMode: .destinationIn)
            }
            
        }
 
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
    
    @IBAction func menuUnwindToFirst (segue: UIStoryboardSegue) {
        
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
