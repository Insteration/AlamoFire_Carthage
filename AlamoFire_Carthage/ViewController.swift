//
//  ViewController.swift
//  AlamoFire_Carthage
//
//  Created by Artem Karmaz on 12/20/18.
//  Copyright © 2018 Artem Karmaz. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var ids = [Int]()
    var id = 1
    
    @IBAction func requestButton(_ sender: UIButton) {
        
    }
    
    @IBAction func webViewButton(_ sender: UIButton) {
        
    }
    
    @IBAction func wkWebViewButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var jsonTextLabel: UILabel!
    
    @IBOutlet weak var responseTextLabel: UILabel!
    
    @IBOutlet weak var jsonDataPickerView: UIPickerView!
    
    override func viewDidLoad() {
        for i in 1...200 {
            self.ids.append(i)
        }
        self.jsonDataPickerView.delegate = self
        self.jsonDataPickerView.dataSource = self
        getJSON()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.ids.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(self.ids[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.id = self.ids[row]
        getJSON()
        print(self.id)
    }
}

extension ViewController {
    fileprivate func getJSON() {
        AF.request("https://jsonplaceholder.typicode.com/todos/\(id)").responseJSON {
            response
            in
            self.jsonTextLabel.text = String(data: response.data!, encoding: String.Encoding.utf8)
            print(response)
            
            var arrStr = [String]()
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!, options: [])
                print("json = \(json)")
                
                guard let jsonArray = json as? [String: Any] else { return }
                print("jsonArray = \(jsonArray)")
                
                var str = ""
                
                for i in jsonArray {
                    print(i.key + ": ", i.value)
                    print(i.key + ": ", i.value, terminator: "", to: &str)
                    arrStr.append(str)
                    str = ""
                }
                
            } catch {
                print("Error parsing")
            }
            print("arrStr = \(arrStr)")
            
            var str = String()
            
            for element in arrStr {
                str += element + "\n"
            }
            self.responseTextLabel.text = str
        }
    }
}
