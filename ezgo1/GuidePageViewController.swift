//
//  GuidePageViewController.swift
//  Guide_test
//
//  Created by vickyliao on 2018/1/31.
//  Copyright © 2018年 vickyliao. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController , UIPageViewControllerDataSource{
    var pageImages = ["guide1","guide2","guide3","guide4"]
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        index = index-1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        index = index+1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int)-> GuideContentViewController?{
        if index < 0 || index >= pageImages.count{
            return nil
        }
        //建立新的視圖控制器並傳遞適合的資料
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "GuideContentViewController") as? GuideContentViewController{
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }

    /*
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "GuideContentViewController") as? GuideContentViewController{
            return pageContentViewController.index
        }
        return 0
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //將資料源設定為自己
        dataSource = self
        
        //建立第一個導覽畫面
        if let startingViewController = contentViewController(at: 0){setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        
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
