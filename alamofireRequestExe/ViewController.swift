//
//  ViewController.swift
//  alamofireRequestExe
//
//  Created by Hsia JiaHung on 2019/7/5.
//  Copyright © 2019年 MEMS. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var str = ""
    
    @IBOutlet weak var print_textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print_textView.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func response_btn(_ sender: UIButton) {
        request01()
    }
    
    
    @IBAction func GET_btn(_ sender: UIButton) {
        request02()
    }
    
    
    func request01() {
        let url_file = "http://192.168.0.117/mySQL_exe/includeEXE.php"
        Alamofire.request(url_file)
            .response { response in
                
                //print(response.request as Any)  // 請求對象
                //print(response.response as Any) // 響應對象
                //print(response.data as Any)     // 伺服器回傳數據
                
                if response.data != nil {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8){
                        //print("Data: \(utf8Text)")
                        self.str = String(utf8Text)
                        //print(self.str)
                        self.print_textView.text = self.str
                    }
                }
        }
        
    }
    
    func request02() {

        Alamofire.request("http://192.168.0.117/mySQL_exe/getEXE.php", parameters: ["term":"bar"])
            .response { response in
                /*print("REQUEST: \(response.request)")// original URL request
                print("URL_RESPONSE: \(response.response)")// URL response
                print("DATA: \(response.data)")// server data
                print("RESULT: \(response.result)")// result of response serialization*/
                /*if response.result.isSuccess {
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")//具体如何解析json内容可看下方“响应处理”部分
                    }
                    
                    if response.data != nil {//解閉包，如果有東西則執行下列程式
                        if let utf8Text = String(data: response.data!, encoding: .ascii){
                            print("Data: \(utf8Text)")
                        }
                    } else {
                        print("error")
                    }
                }*/

                
                if response.data != nil {//解閉包，如果有東西則執行下列程式
                    if let utf8Text = String(data: response.data!, encoding: .utf8){
                        print("Data:------------- \(utf8Text)")
                    }
                } else {
                    print("error")
                }
                
                
                
        }
        
    }
    

}

