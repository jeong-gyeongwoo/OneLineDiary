//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1", "테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2", "테스트3"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        //XIB로 테이블뷰셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요!
        let nib = UINib(nibName: DiaryTableViewCell.identifier, bundle: nil) //초기화
        tableView.register(nib, forCellReuseIdentifier: DiaryTableViewCell.identifier)
        
        //tableView.backgroundColor = .clear
        
        
        //Dynamic Height: 1.automaticDimension 2. label numberOfLines 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    @IBAction func searchBarButtonItemClicked(_ sender: UIBarButtonItem) {
        // 같은 스토리보드일때
        //let sb = UIStoryboard(name: "Main", bundle: nil)
        // sb.
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    @IBAction func addBarButtonItemClicked(_ sender: UIBarButtonItem) {
        
        //1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        vc.type = .add
        
        
        //2-1(옵션) 네이게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        //nav를 사용한다면, present와 화면 전환 방식도 nav로 수정해줘야함!!
        let nav = UINavigationController(rootViewController: vc)
        
        //3. 화면 전환 방식 설정
        //vc.modalTransitionStyle = .flipHorizontal //모달 애니메이션
        nav.modalPresentationStyle = .fullScreen //모달 방식
        //4. 화면 띄우기
        present(nav, animated: true) //alert할때 썼음, modal
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //타입캐스팅 + 옵셔널바인딩
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier) as? DiaryTableViewCell else {
            return UITableViewCell() //클래스의 인스턴스, 빈테이블뷰셀
        }
        
        
        cell.contentLabel.numberOfLines = 0
        cell.contentLabel.text = list[indexPath.row]
        cell.backgroundColor = .clear
        
        return cell
        
    }
    
    //1. System Delete, 셀을 편집가능하게, indexPath으로 개별 셀 지정
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //2. System Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row) //조건문에서 한줄로 줄이기
        //리스트의 인덱스와 테이블뷰의 인덱스랑 다름, 데이터랑 뷰랑 따로 논다
        
        tableView.reloadData() //테이블뷰 갱신
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
                //1. 스토리보드 파일 찾기
                let sb = UIStoryboard(name: "Main", bundle: nil)
                //2. 스토리보드 파일 내 뷰컨트롤러 찾기
                let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        
                vc.type = .edit
                vc.contents = list[indexPath.row]
        
        // vc.contentTextView.text = list[indexPath.row]
        // 안되는 이유 알기 viewdidload
                
                navigationController?.pushViewController(vc, animated: true)
        
        
        
        
        
        
//        //1. 스토리보드 파일 찾기
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        //2. 스토리보드 파일 내 뷰컨트롤러 찾기
//        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//
//        //Pass Data 2. vc가 가지고있는 프로퍼티에 데이터 추가
//        vc.contents = list[indexPath.row]
//        //값 전달시 아웃렛을 활용할 수는 없음!
//       // vc.contentsLabel.text = list[indexPath.row]
//
//
//        //인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push동작
//        //ex) 엔트리 포인트를 네비게이션 앞에 안둠 -> push 동작x
//        navigationController?.pushViewController(vc, animated: true)
//
        
    }
    
  
    
    //    //custom Swipe
    //    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //
    //        UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>)
    //    }
    //    //custom Swipe
    //    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        <#code#>
    //    }
    //
    
}
