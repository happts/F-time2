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
        image1View.image = UIImage(named:"小圆块块1")?.tint(color: UIColor.red, blendMode: .destinationIn)
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
    
    @IBAction func addUnwindToFirst (segue: UIStoryboardSegue) {
        
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
