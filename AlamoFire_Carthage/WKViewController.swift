//
//  WKViewController.swift
//  AlamoFire_Carthage
//
//  Created by Artem Karmaz on 12/21/18.
//  Copyright © 2018 Artem Karmaz. All rights reserved.
//

import UIKit
import WebKit

class WKViewController: UIViewController {
    
    @IBOutlet weak var webKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webKit.allowsBackForwardNavigationGestures = true
        webKit.load(URLRequest(url: URL(string: "https://apple.com/ru/")!))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
