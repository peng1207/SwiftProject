//
//  HomeVM.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation


class HomeVM : NSObject {
    
    fileprivate lazy var requestModel : SPRequestModel = {
        let model = SPRequestModel()
        model.url = "https://api.github.com/"
        model.httpMethod = .get
        return model
    }()
    fileprivate var timer : Timer?
    fileprivate var dataFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    @objc dynamic var model : DataModel?
    fileprivate var isFirst : Bool = true
    override init() {
        super.init()
        sendData()
    }
    fileprivate func sendData(){
        self.model = DataTool.getAll().first
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) { [weak self] in
            self?.requestData()
        }
    }
    fileprivate func requestData(){
        RequestManager.sp_get(requestModel: self.requestModel) { [weak self](data, error) in
          
            if let dic = data as? [String : Any]{
                print("dic")
                self?.dealComplete(data: dic)
            }
        }
    }
    fileprivate func dealComplete(data : [String : Any]?){
        if let dic = data {
            let m = DataModel()
            m.content = "\(dic)"
           
            let date = Date()
            m.title = "结果数据\( date.timeIntervalSince1970)"
            m.time = self.dataFormatter.string(from: date)
        
            self.model = m
            DataTool.insert(data: m)
//            if self.isFirst {
//                startTime()
//                self.isFirst = false
//            }
        }
    }
    func stopTime(){
        if let time = timer, time.isValid{
            time.invalidate()
            timer = nil
        }
    }
    func startTime(){
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self](timer) in
                self?.requestData()
            })
        }
    }
}
