//
//  SecondViewController.swift
//  F-Time
//
//  Created by app on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var todayNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let operate = HandleCoreData()
        todayNum.text = String(operate.queryData())
        let view1 = UIView(frame: CGRect(x: 32, y: 280, width: 23, height: 165))
        let view2 = UIView(frame: CGRect(x: 80, y: 280, width: 23, height: 165))
        let view3 = UIView(frame: CGRect(x: 128, y: 280, width: 23, height: 165))
        let view4 = UIView(frame: CGRect(x: 176, y: 280, width: 23, height: 165))
        let view5 = UIView(frame: CGRect(x: 224, y: 280, width: 23, height: 165))
        let view6 = UIView(frame: CGRect(x: 272, y: 280, width: 23, height: 165))
        let view7 = UIView(frame: CGRect(x: 320, y: 280, width: 23, height: 165))

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

}
