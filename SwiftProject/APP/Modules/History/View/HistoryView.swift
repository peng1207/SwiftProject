//
//  HistoryView.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import UIKit

private let CellID = "HistoryTableCellID"

class HistoryView : UIView {
     lazy var tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.rowHeight = 60
        view.separatorStyle = .none
        view.register(HistoryTableViewCell.self, forCellReuseIdentifier: CellID)
        return view
    }()
    lazy var closeBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Close", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    fileprivate var dataArray : [DataModel] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupUI(){
        self.backgroundColor = UIColor.white
        self.addSubview(self.tableView)
        self.addSubview(self.closeBtn)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(self).offset(0)
            maker.top.equalTo(self).offset(getStatusBarHight())
        }
        self.closeBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(self).offset(-15)
            maker.top.equalTo(self.tableView).offset(0)
        }
    }
}
extension HistoryView : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count > 0 ? 1 : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID)
        if let tmpCell = cell as? RefreshUIData {
            tmpCell.refresh(data: self.dataArray[indexPath.row])
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
extension HistoryView : RefreshUIData{
    func refresh(data: Any?) {
        if let list = data as? [DataModel] {
            self.dataArray = list
            self.tableView.reloadData()
        }
    }
}
