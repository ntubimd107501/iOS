//
//  KnowledgeViewController.swift
//  ezgo1
//
//  Created by vickyliao on 2018/2/6.
//  Copyright © 2018年 vickyliao. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController {
    var aa:Int = 0
    @IBOutlet var btnMenu: UIBarButtonItem!
    //var animalNameArray:Array = [String]()
    //var btnKnowledge:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //animalNameArray = ["","闖關進度","旺哥小檔案","闖關說明","動物小知識","切換語言","關於我們"]
        /*btnKnowledge = [UIImage(named:"kn_hyena")!,UIImage(named:"kn_bear")!,UIImage(named:"kn_wolf")!,UIImage(named:"kn_prairiedog")!,UIImage(named:"kn_kookaburra")!,UIImage(named:"kn_deer")!]
         */
        // Do any additional setup after loading the view.
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn1(_ sender: Any) {aa = 1}
    @IBAction func btn2(_ sender: Any) {aa = 2}
    @IBAction func btn3(_ sender: Any) {aa = 3}
    @IBAction func btn4(_ sender: Any) {aa = 4}
    @IBAction func btn5(_ sender: Any) {aa = 5}
    @IBAction func btn6(_ sender: Any) {aa = 6}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var xx:KnowledgeDetailViewController = segue.destination as! KnowledgeDetailViewController
        xx.whichOne = aa
    }

}
