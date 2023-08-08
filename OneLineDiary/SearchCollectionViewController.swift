//
//  SearchCollectionViewController.swift
//  OneLineDiary
//
//  Created by 정경우 on 2023/07/31.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {
    
    let searchBar = UISearchBar()
    
    let list = ["iOS","iPad","Android","Apple","Watch","사과","사자","호랑이"]
    var searchList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        setCollectionViewLayout()
    }
    
    func setCollectionViewLayout() {
        //cell estimated size none으로 인터페이스 빌더에서 설정할 것
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        //디바이스 전체 너비
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    
    //1. 셀의 갯수 numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    //2. cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        cell.backgroundColor = .brown
        cell.contentsLabel.text = searchList[indexPath.row]
        
        
        return cell
    }
    
    
    
}

//프로토콜 메서드 구분 편하게..
extension SearchCollectionViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("0000000")
        searchList.removeAll()
        
        for item in list {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
    }
    //실시간 검색
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        
        for item in list {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        
        collectionView.reloadData()
    }
}
