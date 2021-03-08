//
//  HomeView.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import UIKit
import SnapKit
class HomeView: UIView {

    fileprivate lazy var scrollView : UIScrollView = {
        let s = UIScrollView()
        s.contentInsetAdjustmentBehavior = .never
        s.isScrollEnabled = true
        s.isUserInteractionEnabled = true
        return UIScrollView()
    }()
    fileprivate lazy var titleLabel : UILabel = {
        return UILabel.initUI(title: "", fontSize: 20)
    }()
    fileprivate lazy var timeLabel : UILabel = {
        return UILabel.initUI(title: "", fontSize: 14, textColor: UIColor.gray)
    }()
    fileprivate lazy var contentLabel : UILabel = {
        return UILabel.initUI(title: "", fontSize: 16, textAlignment: .justified, textColor: UIColor.black.withAlphaComponent(0.8),numberOfLines: 0)
    }()
    lazy var historyBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("History", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        self.backgroundColor = UIColor.white
        self.addSubview(self.scrollView)
        self.addSubview(self.historyBtn)
 
        self.scrollView.addSubview(self.titleLabel)
        self.scrollView.addSubview(self.timeLabel)
        self.scrollView.addSubview(self.contentLabel)
        self.scrollView.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self).offset(0)
            maker.top.equalTo(self).offset(getStatusBarHight())
            maker.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
        self.historyBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(self).offset(-15)
            maker.top.equalTo(self.scrollView.snp.top).offset(20)
        }
        
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.width.equalTo(self.scrollView.snp.width).offset(-30)
            maker.left.equalTo(self.scrollView).offset(15)
            maker.centerX.equalTo(self.scrollView.snp.centerX).offset(0)
            maker.top.equalTo(self.scrollView).offset(10)

        }
        self.timeLabel.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self.titleLabel).offset(0)
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(10)
        }
        self.contentLabel.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self.titleLabel).offset(0)
            maker.top.equalTo(self.timeLabel.snp.bottom).offset(20)
            maker.height.greaterThanOrEqualTo(0)
            maker.bottom.equalTo(self.scrollView.snp.bottom).offset(-20)
        }
    }
}
extension HomeView : RefreshUIData{
    func refresh(data: Any?) {
        if let model = data as? DataModel {
            self.titleLabel.text = model.title
            self.timeLabel.text = model.time
            self.contentLabel.text = model.content
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
}
