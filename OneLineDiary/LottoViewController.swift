//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/08/03.
//

import UIKit
import SwiftyJSON
import Alamofire

//struct LottoNumber {
//    var drwtNo1: Int
//    var drwtNo2: Int
//    var drwtNo3: Int
//    var drwtNo4: Int
//    var drwtNo5: Int
//    var drwtNo6: Int
//    var bnusNo: Int
//}


class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var numberTextField: UITextField!
    let pickerView = UIPickerView()
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var lottoNumberLabel: UILabel!
   
    var lottoNumber: [Int] = []
    var list :[Int] = Array(1...1079).reversed()
    //Array(repeating: 100, count: 10) 100을 10번반복
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest(number: 1079)
        numberTextField.inputView = pickerView
        // 커서 안보이게
        numberTextField.tintColor = .clear
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }
    
    func callRequest (number:Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let date = json["drwNoDate"].stringValue
                //                var lottoNumber = LottoNumber(drwtNo1: json["drwtNo1"].intValue, drwtNo2: json["drwtNo2"].intValue, drwtNo3: json["drwtNo3"].intValue, drwtNo4: json["drwtNo4"].intValue, drwtNo5: json["drwtNo5"].intValue, drwtNo6: json["drwtNo6"].intValue, bnusNo: json["bnusNo"].intValue)
                
                self.lottoNumber.append(contentsOf: [json["drwtNo1"].intValue, json["drwtNo2"].intValue, json["drwtNo3"].intValue, json["drwtNo4"].intValue, json["drwtNo5"].intValue, json["drwtNo6"].intValue, json["bnusNo"].intValue])
                
                self.dateLabel.text = date
                self.lottoNumberLabel.text = "\(self.lottoNumber)번"
                self.lottoNumber.removeAll()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select \(row)")
        numberTextField.text = "\(list[row])"
        callRequest(number: list[row])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
    }
    
    
    
}
