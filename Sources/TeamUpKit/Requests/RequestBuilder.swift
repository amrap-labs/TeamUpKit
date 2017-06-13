//
//  RequestBuilder.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 13/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

protocol RequestBuilderAuthProvider: class {
    
    func requestBuilder(requestMasterAuthHeaders requestBuilder: RequestBuilder) -> [String : Any]?
    
    func requestBuilder(requestUserAuthHeaders requestBuilder: RequestBuilder) -> [String : Any]?
}

class RequestBuilder {
    
    // MARK: Properties
    
    let config: Config
    let urlBuilder: UrlBuilder
    
    weak var authProvider: RequestBuilderAuthProvider?
    
    // MARK: Init
    
    init(with config: Config, urlBuilder: UrlBuilder) {
        self.config = config
        self.urlBuilder = urlBuilder
    }
    
    // MARK: Building
    
    func build(for endpoint: Endpoint,
               headers: Request.Headers) -> Request {
        return Request(with: urlBuilder.build(for: endpoint),
                       headers: generateHeaders(for: headers))
    }
    
    // MARK: Header Generation
    
    private func generateHeaders(for headersType: Request.Headers) -> [String : Any]? {
        switch headersType {
        case .none:
            return nil
            
        case .masterAuthenticated:
            return authProvider?.requestBuilder(requestMasterAuthHeaders: self)
            
        case .userAuthenticated:
            return authProvider?.requestBuilder(requestUserAuthHeaders: self)
            
        case .custom(let headers):
            return headers
        }
    }
}
