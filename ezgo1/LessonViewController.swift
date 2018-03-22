//
//  LessonViewController.swift
//  ezgo1
//
//  Created by vickyliao on 2017/11/22.
//  Copyright © 2017年 vickyliao. All rights reserved.
//

import UIKit
//import CoreImage
class LessonViewController: UIViewController {
    static var uuid=""
    public var filePath = NSHomeDirectory() + "/Documents/user.txt"
    
    //the json file url
    let urlWorksheet = "http://ezgo.twjoin.com/showQuest/1";
    
    //A string array to save all the names
    var nameArray = [String]()
    
    @IBOutlet var btnHyena: UIButton!
    @IBOutlet var btnDeer: UIButton!
    @IBOutlet var btnKookaburra: UIButton!
    @IBOutlet var btnPrairiedog: UIButton!
    @IBOutlet var btnWolf: UIButton!
    @IBOutlet var btnBear: UIButton!
    @IBOutlet var btnMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //read device id====================================================
        //do{
        //    let loading = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
        //    print("read:",loading)
        //}catch{
        //    print("No save file")
        //}
        //print("worksheet read uuid=",LessonViewController.uuid)
        //==================================================================
        
        getJsonFromUrl();
        
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        let origin = CIImage(image:UIImage(named:"sticker_hyena-1.png")!)
        
        let filter = CIFilter(name:"CIPhotoEffectMono")
        filter?.setDefaults()
        filter?.setValue(origin,forKey:kCIInputImageKey)
        
        if let output = filter?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnHyena.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
        let origin2 = CIImage(image:UIImage(named:"sticker_bear-1.png")!)
        
        let filter2 = CIFilter(name:"CIPhotoEffectMono")
        filter2?.setDefaults()
        filter2?.setValue(origin2,forKey:kCIInputImageKey)
        
        if let output = filter2?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnBear.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
        let origin3 = CIImage(image:UIImage(named:"sticker_wolf-1.png")!)
        
        let filter3 = CIFilter(name:"CIPhotoEffectMono")
        filter3?.setDefaults()
        filter3?.setValue(origin3,forKey:kCIInputImageKey)
        
        if let output = filter3?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnWolf.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
        let origin4 = CIImage(image:UIImage(named:"sticker_prairiedog-1.png")!)
        
        let filter4 = CIFilter(name:"CIPhotoEffectMono")
        filter4?.setDefaults()
        filter4?.setValue(origin4,forKey:kCIInputImageKey)
        
        if let output = filter4?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnPrairiedog.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
        let origin5 = CIImage(image:UIImage(named:"sticker_kookaburra-1.png")!)
        
        let filter5 = CIFilter(name:"CIPhotoEffectMono")
        filter5?.setDefaults()
        filter5?.setValue(origin5,forKey:kCIInputImageKey)
        
        if let output = filter5?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnKookaburra.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
        let origin6 = CIImage(image:UIImage(named:"sticker_deer-1.png")!)
        
        let filter6 = CIFilter(name:"CIPhotoEffectMono")
        filter6?.setDefaults()
        filter6?.setValue(origin6,forKey:kCIInputImageKey)
        
        if let output = filter6?.outputImage{
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            btnDeer.setImage(UIImage(cgImage:tmp!), for: UIControlState.normal)
        }
        
    }
    
    //this function is fetching the json from URL
    func getJsonFromUrl(){
        //creating a NSURL
        let url = NSURL(string: urlWorksheet)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                //let record = String(data: jsonObj, decoding: .utf8)
                //let record = JSONDecoder(jsonObj.value(forKey: "record"))
                print(jsonObj!.value(forKey: "record")!)
                print(jsonObj!.value(forKey: "option")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "record") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "option") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)!)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    //self.showNames()
                })
            }
        }).resume()
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

