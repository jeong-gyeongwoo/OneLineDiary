//
//  SettingTableViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/08/01.
//

import UIKit

enum SettingOption: Int, CaseIterable {
    
  case total, personal, others
    
    var mainOptions: String{
        //get 키워드 생략
        switch self {
        case .total: return "전체 설정"
        case .personal: return "개인 설정"
        case .others: return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total: return ["공지사항","실험실","버전 정보"]
        case .personal: return ["개인/보안","알림","채팅","멀티프로필"]
        case .others: return ["고객센터/도움말"]
        }
    }
    
}



class SettingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOption.allCases.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOption.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = SettingOption.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOption.allCases[section].mainOptions
    }
    
    
}

