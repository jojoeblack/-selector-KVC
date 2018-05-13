//
//  ViewController.swift
//  demoFour
//
//  Created by MacPro on 2018/3/26.
//  Copyright © 2018年 JoeMac01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var strMsg: String = ""
    @IBOutlet weak var btnSelector: UIButton!
    @IBOutlet weak var btnDelegate: UIButton!
    @IBOutlet weak var btnKVC: UIButton!
    @IBOutlet weak var myTextView: UITextView!
    
    @IBAction func btnSelector_Click(_ sender: Any) {
        let myMethod: Selector = #selector(printText)
        self.perform(myMethod)
        self.perform(#selector(printText2(text1:)), with: "參數測試1")
        self.perform(#selector(printText3(text1:text2:)), with:"參數測試2", with:"參數測試3")
        self.perform(#selector(printText2(text1:)), with: "延遲三秒", afterDelay: 3.0)
    }
    @IBAction func btnDelegate_Click(_ sender: Any) {
    }
    @objc func printText() {
        strMsg += "printText執行:\n"
        myTextView.text = strMsg
    }
    @objc func printText2(text1:String) {
        strMsg += "printText2執行:\(text1)\n"
        myTextView.text = strMsg
    }
    @objc func printText3(text1: String, text2: String) {
        strMsg += "printText3執行:\(text1), \(text2)\n"
        myTextView.text = strMsg
    }
    @IBAction func btnKVC_Click(_ sender: Any) {
    }

    @IBOutlet weak var txvMsg: UITextView!

   
    
    
    ////////////////////////////////////////////
    func 建立UILabel(){
        let myFrame:CGRect = CGRect(x: 160.0, y: 250.0, width: 150.0, height: 40.0)
        let myLabel: UILabel = UILabel(frame: myFrame)
        myLabel.backgroundColor = UIColor.green
        myLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.1, alpha: 1.0)
        myLabel.text = "程式化標籤"
        myLabel.font = UIFont.systemFont(ofSize: 18.0)
        myLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(myLabel)
    }
    
    @IBAction func myButton_Click(_ sender: Any){
        strMsg += "程式按鈕按下了\n"
        myTextView.text = strMsg
    }
    func 建立UIButton(){
        let myFram: CGRect = CGRect(x: 5.0, y: 250.0, width: 150.0, height: 40.0)
        let myButton: UIButton = UIButton(type: UIButtonType.system)
        myButton.frame = myFram
        myButton.backgroundColor = UIColor(red: 0.9, green: 0.6, blue: 0.6, alpha: 1.0)
        myButton.tintColor = UIColor.white
        myButton.setTitle("程式化按鈕", for: UIControlState.normal)
        myButton.setTitle("按下狀態", for: UIControlState.highlighted)
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        
        myButton.addTarget(self, action: #selector(myButton_Click(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(myButton)
    }
    override func viewDidLoad(){
        建立UILabel()
        建立UIButton()
        super.viewDidLoad()
    }
}






