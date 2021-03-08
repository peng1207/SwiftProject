//
//  RequestManager.swift
//  SwiftProject
//
//  Created by 黄树鹏 on 2021/3/8.
//

import Foundation
import Alamofire
// 封装请求类 减少跟第三方接触
enum SP_HttpMethod {
    case get
    case post
    case head
    case put
}

enum SP_ResponseFormat {
    case json
    case data
    case string
}
typealias SPRequestBlock = (_ data : Any? ,_ error: Error?) -> Void

class RequestManager {
    static  fileprivate var requestCacheArr = [DataRequest]()
    
    class func sp_get(requestModel : SPRequestModel,requestBlock : SPRequestBlock?) {
        guard let url = requestModel.url else {
           
            if  let block = requestBlock {
                block(nil,nil)
            }
            return
        }
     
        guard let requestUrl = URL(string: url) else {
           
            if  let block = requestBlock {
                block(nil,nil)
            }
            return
        }
        
        var httpMethod : HTTPMethod = .post
        switch requestModel.httpMethod {
        case .get:
            httpMethod = .get
        case .post:
            httpMethod = .post
        case .head :
            httpMethod = .head
        case .put :
            httpMethod = .put
        }
        let dataRequest = Alamofire.AF.request(requestUrl, method: httpMethod, parameters: requestModel.parm)
 
     
        requestModel.isRequest = true
    
        switch requestModel.reponseFormt {
        case .json:
           
            dataRequest.responseJSON { (dataResponse : DataResponse) in
                sp_requestSuccess(dataResponse: dataResponse, requestModel: requestModel, requestBlock: requestBlock)
            }
        case .data:
            dataRequest.responseData { (dataResponse:DataResponse) in

            }
        case .string:
            dataRequest.responseString { (dataResponse : DataResponse) in

            }
        }
    }
    
    private class func sp_requestSuccess(dataResponse : AFDataResponse<Any>,requestModel : SPRequestModel ,requestBlock : SPRequestBlock?){
        requestModel.isRequest = false
        guard let block = requestBlock else {
            return
        }
        block(dataResponse.value,dataResponse.error)
       
    }
    class func sp_removeAllCache(){
        for task in self.requestCacheArr {
            task.cancel()
        }
        self.requestCacheArr.removeAll()
    }
    class func sp_remove(task:DataRequest) {
        
    }
    
}
class SPRequestModel : NSObject {
    /// 请求链接
    var url : String?
    /// 请求参数
    var parm : [String: Any]?
    /// 是否正在请求中
    var isRequest : Bool = false
    var httpMethod : SP_HttpMethod = .post
    var reponseFormt : SP_ResponseFormat = .json
    var data : [Data]?
    var name : String?
    var fileName : [String]?
    var mineType : String?
}

