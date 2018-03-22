//
//  MenuViewController.swift
//  ezgo1
//
//  Created by vickyliao on 2017/11/5.
//  Copyright © 2017年 vickyliao. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var menuNameArray:Array = [String]()
    var iconImage:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArray = ["地圖導覽","闖關進度","旺哥小檔案","闖關說明","動物小知識","切換語言","關於我們"]
        iconImage = [UIImage(named:"ezgo")!,UIImage(named:"assignment")!,UIImage(named:"footprint")!,UIImage(named:"info")!,UIImage(named:"knowledge")!,UIImage(named:"translate")!,UIImage(named:"contact")!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.imgIcon.image = iconImage[indexPath.row]
        cell.lblMenuName.text! = menuNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.lblMenuName.text! == "地圖導覽"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "闖關進度"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "LessonViewController") as! LessonViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "旺哥小檔案"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "DogInfoViewController") as! DogInfoViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "闖關說明"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "GuideViewController") as! GuideViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "動物小知識"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "KnowledgeViewController") as! KnowledgeViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.lblMenuName.text! == "關於我們"{
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
            let newViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            let newFrontViewController = UINavigationController.init(rootViewController:newViewcontroller)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
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
