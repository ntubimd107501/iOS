//
//  GuideContentViewController.swift
//  Guide_test
//
//  Created by vickyliao on 2018/1/31.
//  Copyright © 2018年 vickyliao. All rights reserved.
//

import UIKit

class GuideContentViewController: UIViewController {
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var forwardButton: UIButton!
    static var uuid = ""
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        switch index{
        case 3:
            UserDefaults.standard.set(true, forKey: "hasViewedGuide")
            dismiss(animated: true, completion: nil)
            GuideContentViewController.uuid = NSUUID().uuidString
            UserDefaults.standard.set(GuideContentViewController.uuid, forKey: "device id")
            
            //上傳device id
            let defaults = UserDefaults.standard
            let name = defaults.string(forKey: "device id")
            let parameters = ["device_id" : name]
            
            guard let url = URL(string:"http://ezgo.twjoin.com/update")else{return}
            var request = URLRequest(url:url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else{return}
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with:request){(data,response,error) in
                if let response = response{
                    print("\(response)")
                    //UserDefaults.standard.set(response.value(forKey: "user_id") , forKey: "user id")
                    //let user_id = UserDefaults.standard.string(forKey: "user_id")
                    //print("====user id=",user_id as Any)
                }
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options:[.allowFragments]) as? NSDictionary
                        //print(json)
                        print(json!)
                        print(json!.value(forKey: "userID")!)
                        //UserDefaults.standard.set(String(data: (json!.value(forKey: "userID") as! Data), encoding: String.Encoding.utf8) , forKey: "user id")
                        //let user_id = UserDefaults.standard.string(forKey: "user_id")
                        //print("====user id=", UserDefaults.standard.string(forKey: "user_id")!)
                        //self.label.text = json[0]["record_done"]
                    }catch{
                        print(error)
                    }
                }
                }.resume()
        default:
            break
        }
    }
    @IBOutlet var startImage: UIImageView!
    var imageFile = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        contentImageView.image = UIImage(named: imageFile)
        pageControl.currentPage = index
        switch index{
        case 0...2:
            startImage.isHidden = true
        case 3:
            startImage.isHidden = false
        default:
            break
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
