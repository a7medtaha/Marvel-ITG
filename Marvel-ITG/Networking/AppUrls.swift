

import Foundation
import CommonCrypto

enum API_status: Int {
    case Success                = 200
    case Failed                 = 401
    case JwtExpired             = 403
}


class AppUrls{
    private var limit: Int = 30
    private let baseURL = "https://gateway.marvel.com"
    static let shared  = AppUrls()
    private init (){}
//    static let shared = AppUrls()
    func getCharacters(pageNumber: Int = 0) -> String{
        let endpoint = "/v1/public/characters"
        let url = baseURL + endpoint + buildQueryString(pageNumber: pageNumber, isCharacterList: true)
        return url
        
    }
    
    func getComics(id: Int) -> String{
        // https://gateway.marvel.com/v1/public/characters/1011334/comics
        let endpoint = "/v1/public/characters/\(id)/comics"
        let url = baseURL + endpoint + buildQueryString()
        
        return url
        
    }
    
    private func buildQueryString(pageNumber: Int = 0, isCharacterList: Bool = false) -> String{
        let timeStamp = Date().timeIntervalSince1970
        var queryString = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        if isCharacterList{
            var pageNumber = pageNumber
            pageNumber = limit * pageNumber
            queryString = queryString + "&limit=\(limit)&offset=\(pageNumber)"
        }
        return queryString
    }
    
    private func buildHashToken(timestamp: TimeInterval) -> String{
        let unhashedString = "\(timestamp)" + privateKey + publicKey
        return MD5(str: unhashedString)
    }
    
    private func MD5(str: String) -> String {
        if let strData = str.data(using: String.Encoding.utf8) {
            /// #define CC_MD5_DIGEST_LENGTH    16          /* digest length in bytes */
            /// Creates an array of unsigned 8 bit integers that contains 16 zeros
            var digest = [UInt8](repeating: 0, count:Int(CC_MD5_DIGEST_LENGTH))
            
            /// CC_MD5 performs digest calculation and places the result in the caller-supplied buffer for digest (md)
            /// Calls the given closure with a pointer to the underlying unsafe bytes of the strData’s contiguous storage.
            _ = strData.withUnsafeBytes {
                // CommonCrypto
                // extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md) --|
                // OpenSSL                                                                          |
                // unsigned char *MD5(const unsigned char *d, size_t n, unsigned char *md)        <-|
                CC_MD5($0.baseAddress, UInt32(strData.count), &digest)
            }
            
            
            var md5String = ""
            /// Unpack each byte in the digest array and add them to the md5String
            for byte in digest {
                md5String += String(format:"%02x", UInt8(byte))
            }
            
            return md5String
            
        }
        return ""
    }
    
}

