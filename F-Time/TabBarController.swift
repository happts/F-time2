//
//  TabBarController.swift
//  F-Time
//
//  Created by app on 17/7/23.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor(red: 161/255, green: 150/255, blue: 155/255, alpha: 1)
        
        var items: [UITabBarItem] = self.tabBar.items! as [UITabBarItem]
        //设置默认图片直接在IB添加新tabBar的时候Image选择好，这里是修改被选中时的图片
        //通过name获取图片，将设计切好的图 放到Images.xcassets中
        let tabbar0SelectedImage = UIImage(named: "tag129")
        let tabbar1SelectedImage = UIImage(named: "tag229")
        let tabbar2SelectedImage = UIImage(named: "tag329")
        //因为我的项目就三个tabbarItem
        //设置selectedImage
        
        items[0].image = tabbar0SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        items[1].image = tabbar1SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        items[2].image = tabbar2SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        items[0].selectedImage = tabbar0SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        items[1].selectedImage = tabbar1SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        items[2].selectedImage = tabbar2SelectedImage!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
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
