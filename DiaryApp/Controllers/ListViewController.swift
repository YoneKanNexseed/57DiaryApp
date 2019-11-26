//
//  ListViewController.swift
//  DiaryApp
//
//  Created by yonekan on 2019/11/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toInput", sender: nil)
        
    }

}
