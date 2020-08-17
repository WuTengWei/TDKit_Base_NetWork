//
//  ViewController.swift
//  TDKit_Base_NetWork
//
//  Created by wutengwei on 08/10/2020.
//  Copyright (c) 2020 wutengwei. All rights reserved.
//

import UIKit
import TDKit_Base_NetWork

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WechatAuthSDK()
        
        print(AlipaySDK.defaultService())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

