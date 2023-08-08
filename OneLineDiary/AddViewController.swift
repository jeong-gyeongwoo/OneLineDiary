//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = "수정 화면"
}

//1. UITextViewDelegate
//2. contentTextView.delegate = self
//3. 필요한 메서드 호출해서 구현
class AddViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var contentTextView: UITextView!
    var type: TransitionType = .add
    
    var contents: String?
    
    //placeholder
    let placeholderText = "내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.delegate = self
        
        setBackgroundColor()
        //추가 화면 일때는 빈 텍스트뷰를, 수정 화면 일 때는 이전 내용을 값 전달해서 텍스트뷰에 보여주기
        switch type {
        case .add:
            
            title = type.rawValue
            // let xmark = UIImage(systemName: "xmark")
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
            
            navigationItem.leftBarButtonItem?.tintColor = .black
            contentTextView.text = placeholderText
            contentTextView.textColor = .lightGray
            
        case .edit:
            title = type.rawValue
            guard let contents else {return}
            contentTextView.text = contents
        }
}
    //편집이 시작될 때(커서가 시작될 때)
    //플레이스홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        //if textView.text == placeholderText {
        if textView.textColor == .gray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    //편집이 끝날 때(커서가 없어지는 순간)
    //사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 설정!
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
            
        }
    }
    
    
    
    @objc
    func closeButtonClicked() {
        //push - pop, present- dismiss로 화면 열고 닫는법 맞춰주기
        dismiss(animated: true)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count)글자"
    }
    
    
}

