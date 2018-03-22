//
//  KnowledgeDetailViewController.swift
//  ezgo1
//
//  Created by Administrator on 2018/2/23.
//  Copyright © 2018年 vickyliao. All rights reserved.
//

import UIKit

class KnowledgeDetailViewController: UIViewController {
    var whichOne = Int()
    
    func whichKnowledge(whichOne:Int) -> String {
        var picture:String
        switch whichOne {
        case 1:
            picture = "knowledge_hyena.png"
        case 2:
            picture = "knowledge_bear.png"
        case 3:
            picture = "knowledge_wolf.png"
        case 4:
            picture = "knowledge_prairiedog.png"
        case 5:
            picture = "knowledge_kookaburra.png"
        case 6:
            picture = "knowledge_deer.png"
            
        default:
            picture = "GG"
        }
        return picture
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        //--------------------------------
        
        // 使用 UIImageView(frame:) 建立一個 UIImageView
        var myImageView2 = UIImageView(
            frame: CGRect(
                x: 0, y: 0, width: fullScreenSize.width , height: fullScreenSize.height))
        
        // 使用 UIImage(named:) 放置圖片檔案
        myImageView2.image = UIImage(named: "knowledge_background.png")
        
        // 設置新的位置並放入畫面中
        myImageView2.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.5)
        self.view.addSubview(myImageView2)
        myImageView2.contentMode = .scaleToFill
        
        //--------------------------------
        // 使用 UIImageView(frame:) 建立一個 UIImageView
        var myImageView1 = UIImageView(
            frame: CGRect(
                x: 0, y: 0, width: fullScreenSize.width - 25, height: fullScreenSize.height - 50))
        
        // 使用 UIImage(named:) 放置圖片檔案
        myImageView1.image = UIImage(named: whichKnowledge(whichOne:whichOne))
        
        // 設置新的位置並放入畫面中
        myImageView1.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.55)
        self.view.addSubview(myImageView1)
        myImageView1.contentMode = .scaleToFill
        
        //--------------------------------
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

