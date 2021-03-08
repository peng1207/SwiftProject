//
//  DetaileVC.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/9.
//

import UIKit
import RxSwift
class DetaileVC: UIViewController {
    fileprivate lazy var homeView : HomeView = {
        return HomeView()
    }()
    var model : DataModel?
   fileprivate let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindData()
        bindEvent()
        // Do any additional setup after loading the view.
    }
    /// 添加UI
    fileprivate func setupUI(){
        self.view = self.homeView
        self.homeView.historyBtn.setTitle("Close", for: .normal)
    }
    fileprivate func bindData(){
        self.homeView.refresh(data: model)
    }
    fileprivate func bindEvent(){
        self.homeView.historyBtn.rx.tap.subscribe { [weak self]() in
            self?.dismiss(animated: true, completion: nil)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)
    }

}
