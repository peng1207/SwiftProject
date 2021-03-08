//
//  HistoryVC.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import UIKit
import RxSwift
class HistoryVC: UIViewController {
    
   fileprivate lazy var historyView : HistoryView = {
        return HistoryView()
    }()
    fileprivate lazy var historyVM : HistoryVM = {
        return HistoryVM()
    }()
    fileprivate let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindData()
        bindEvent()
        // Do any additional setup after loading the view.
    }
    private func setupUI(){
      
        self.view = self.historyView
    }
    
}
extension HistoryVC{
    fileprivate func bindData(){
        self.historyVM.rx.observe(\.dataArray).subscribe { [weak self](list) in
            self?.historyView.refresh(data: list)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)

    }
    fileprivate func bindEvent(){
        self.historyView.closeBtn.rx.tap.subscribe { [weak self]() in
            self?.dismiss(animated: true, completion: nil)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)
        self.historyView.tableView.rx.itemSelected.subscribe { [weak self](index) in
            self?.dealSelect(indexPath: index)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)

    }
}
extension HistoryVC {
    fileprivate func dealSelect(indexPath : IndexPath){
        let detVC = DetaileVC()
        detVC.model = historyVM.getSelectData(indexPath: indexPath)
        detVC.modalPresentationStyle = .fullScreen
        self.present(detVC, animated: true, completion: nil)
    }
    
}
