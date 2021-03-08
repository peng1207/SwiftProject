//
//  HistoryTableViewCell.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    fileprivate lazy var titleLabel : UILabel = {
        return UILabel.initUI(title: "", fontSize: 16, textAlignment: .left)
    }()
    fileprivate lazy var timeLabel : UILabel = {
        return UILabel.initUI(title: "", fontSize: 14, textAlignment: .left, textColor: .gray)
    }()
    fileprivate lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkText.withAlphaComponent(0.5)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setupUI(){
        self.selectionStyle = .none
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.lineView)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.contentView).offset(15)
            maker.right.equalTo(self.contentView).offset(-15)
            maker.bottom.equalTo(self.contentView.snp.centerY).offset(-2)
        }
        self.timeLabel.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self.titleLabel).offset(0)
            maker.top.equalTo(self.contentView.snp.centerY).offset(2)
        }
        self.lineView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(self.contentView).offset(0)
            maker.height.equalTo(1)
        }
    }
    

}
extension HistoryTableViewCell : RefreshUIData{
    func refresh(data: Any?) {
        if let model = data as? DataModel {
            self.titleLabel.text = model.title
            self.timeLabel.text = model.time
        }
    }
}
