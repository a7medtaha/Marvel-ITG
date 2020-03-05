
import Foundation
import Alamofire


enum ErrorCode:Int {
    case Caneled = -999
    case NoInternet = -1009
    case UnKnown = 000
}
//MARK:- MESSAGES
let CONNECTION_ERROR = "Connection Error"
let EMPTY_DATA = "Connection Error"
let TURN_LOCATION = "Turn on location services"
let SETTING = "Setting"
let SEND_SUCCESSFULLY = "Send Successfully"
let ENTER_VALID_EMAIL = "Enter a valid Email"
let NO_NOTIFICATIONS = "No Notifications at the moment."
let NOT_ALLOW_NUMBER = "This app is not allowed to Call Numbers"
let CHAT = "Chat"


typealias errorType = (ErrorCode, Any?) -> ()
typealias errorCompletionType = ((ErrorCode?)->())


class APIManager {
    
    
    func requestWith(upload data: Data,to url:String,withkey name:String ,andExtension extn:(type:String,ext:String),forbody parameters: [String : Any], success: @escaping  (Any) -> (), errorHandler:  @ escaping errorType){
       
        let headers: HTTPHeaders? = nil
         Alamofire.upload(multipartFormData: { (multipartFormData) in
             for (key, value) in parameters { // this for loop for appendding (parameters Dictionary) to (multipartFormData Array)
                 multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
             }
            multipartFormData.append(data, withName: name, fileName: "\(Date().timeIntervalSinceNow).\(extn.ext)", mimeType: "\(extn.type)/\(extn.ext)")
             
         }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
             switch result{
             case .success(let upload, _, _):
                 upload.responseJSON { response in
                 print("sucess")
                     if response.result.error != nil {
                         print("@PIManger\( response.result.error!)")
                         if let errorCodeValue = response.error?._code,
                             let errorCode = ErrorCode(rawValue: errorCodeValue){
                             errorHandler(errorCode, response.error)
                         } else {
                             errorHandler(ErrorCode.UnKnown, response.error)
                         }
                         return
                     }
                     
                     if response.data?.count == 0 {
                         errorHandler(ErrorCode.UnKnown, "No Data Retrived")
                         return
                     }
                     if let responseValue = response.value {
                         success(responseValue)
                     }
                     
                 }
             case .failure(let error):
                 print("Error in upload: \(error.localizedDescription)")
                errorHandler(ErrorCode.UnKnown, error)

             }
         }
     }

    
    func contectToApiWith(url : String , methodType : HTTPMethod ,params : [String:Any]?, success: @escaping (Any) -> (), errorHandler: @ escaping errorType ) {
        let HEADER: HTTPHeaders? = nil
        
        Alamofire.request(url,
                          method: methodType,
                          parameters: params,
                          encoding: URLEncoding.default, headers: HEADER).validate().responseJSON{ response in
                            if response.result.error != nil {
                                print("@PIManger\( response.result.error!)")
                                if let errorCodeValue = response.error?._code,
                                    let errorCode = ErrorCode(rawValue: errorCodeValue){
                                    errorHandler(errorCode, response.error)
                                } else {
                                    errorHandler(ErrorCode.UnKnown, response.error)
                                }
                                return
                            }
                            
                            if response.data?.count == 0 {
                                errorHandler(ErrorCode.UnKnown, "No Data Retrived")
                                return
                            }
                            if let responseValue = response.value {
                                success(responseValue)
                            }
        }
        
        
    }
    func contectToApiWith(jsonRequest:Bool ,url : String , methodType : HTTPMethod ,params : [String:Any]?, success: @escaping (Any) -> (), errorHandler: @ escaping errorType ) {
        let HEADER: HTTPHeaders? = nil
        
        Alamofire.request(url,
                          method: methodType,
                          parameters: params,
                          encoding: JSONEncoding.default, headers: HEADER).validate().responseJSON{ response in
                            if response.result.error != nil {
                                print("@PIManger\( response.result.error!)")
                                if let errorCodeValue = response.error?._code,
                                    let errorCode = ErrorCode(rawValue: errorCodeValue){
                                    errorHandler(errorCode, response.error)
                                } else {
                                    errorHandler(ErrorCode.UnKnown, response.error)
                                }
                                return
                            }
                            
                            if response.data?.count == 0 {
                                errorHandler(ErrorCode.UnKnown, "No Data Retrived")
                                return
                            }
                            if let responseValue = response.value {
                                success(responseValue)
                            }
        }
        
        
    }

    
}
