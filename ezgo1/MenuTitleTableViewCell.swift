//
//  MenuTitleTableViewCell.swift
//  ezgo1
//
//  Created by vickyliao on 2018/2/2.
//  Copyright © 2018年 vickyliao. All rights reserved.
//

import UIKit

class MenuTitleTableViewCell: UITableViewCell {
    @IBOutlet var lblMenuTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let t_cell = tableView.dequeueReusableCell(withIdentifier: "MenuTitleTableViewCell") as! MenuTitleTableViewCell
    
        t_cell.lblMenuTitle.text! = "EZGo-旺事如意"
        
        return t_cell
        
    }

}
