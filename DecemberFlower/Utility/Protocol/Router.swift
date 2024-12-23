//
//  Router.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import Alamofire

protocol Router {
    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
//    var defaultHeader: HTTPHeaders { get }
    var optionalHeaders: HTTPHeaders? { get } // secretHeader 말고도 추가적인 헤더가 필요시
    var headers: HTTPHeaders { get } // 다 합쳐진 헤더
    var parameters: Parameters? { get }
    var body: Data? { get }
    var encodingType: EncodingType { get }
}

extension Router {
    
    var baseURL: String {
        return "http://43.201.232.60:8080/"
    }
    
    var headers: HTTPHeaders {
        var combine = HTTPHeaders()
        if let optionalHeaders {
            optionalHeaders.forEach { header in
                combine.add(header)
            }
        }
        return combine
    }
    
    func asURLRequest() throws(RouterError) -> URLRequest {
        let url = try baseURLToURL()
        
        var urlRequest = try urlToURLRequest(url: url)
        
        switch encodingType {
        case .url:
            do {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                
                return urlRequest
            } catch {
                throw .encodingFail
            }
        case .json:
            do {
                let jsonObject = CodableManager.shared.toJSONSerialization(data: body)
                urlRequest = try JSONEncoding.default.encode(urlRequest, withJSONObject: jsonObject)
                return urlRequest
            } catch {
                throw .decodingFail
            }
        }
    }
    
    private func baseURLToURL() throws(RouterError) -> URL {
        do {
            let url = try baseURL.asURL()
            return url
        } catch let error as AFError {
            if case .invalidURL = error {
                throw .urlFail(url: baseURL)
            } else {
                throw .unknown
            }
        }catch {
            throw .unknown
        }
    }
    
    private func urlToURLRequest(url: URL) throws(RouterError) -> URLRequest {
        do {
            let urlRequest = try URLRequest(url: url.appending(path: path), method: method, headers: headers)
            
            return urlRequest
        } catch let error as AFError {
            if case .invalidURL = error {
                throw .urlFail(url: baseURL)
            } else {
                throw .unknown
            }
        }catch {
            throw .unknown
        }
    }

    func requestToBody(_ request: Encodable) -> Data? {
        do {
            return try CodableManager.shared.jsonEncoding(from: request)
        } catch {
            #if DEBUG
            print("requestToBody Error")
            #endif
            return nil
        }
    }
}
