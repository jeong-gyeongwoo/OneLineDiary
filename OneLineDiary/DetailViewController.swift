//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
//pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 공간"
    
    
    @IBOutlet var contentsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        
        //pass data 3. 전달 받은 값을 뷰에 표현
        print(contents)
        contentsLabel.text = contents
        contentsLabel.textColor = .black
        contentsLabel.numberOfLines = 0
    }
    
    //툴바사용 barbutton item + flexible space bar ...
    @IBAction func deleteButtonClicked(_ sender: UIBarButtonItem) {
        
        //push - pop, 네비게이션컨트롤러가 있어야함
        navigationController?.popViewController(animated: true)
        
        
    }
    

}
