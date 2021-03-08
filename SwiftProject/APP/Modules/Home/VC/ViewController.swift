//
//  ViewController.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

    fileprivate lazy var homeView : HomeView = {
        return HomeView()
    }()
    fileprivate lazy var homeVM : HomeVM = {
        return HomeVM()
    }()
    fileprivate let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        setupUI()
        bindEvent()
        bindData()
        // Do any additional setup after loading the view.
    }
}


extension ViewController{
    /// 添加UI
    fileprivate func setupUI(){
        self.view = self.homeView
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    fileprivate func bindData(){
        self.homeVM.rx.observe(\.model).subscribe { [weak self](model) in
            self?.homeView.refresh(data: model)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)

    }
    fileprivate func bindEvent(){
        self.homeView.historyBtn.rx.tap.subscribe { [weak self]() in
            let vc = HistoryVC()
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        } onError: { (error) in
            
        } onCompleted: {
            
        } onDisposed: {
            
        }.disposed(by: disposeBag)

        
    }
}
