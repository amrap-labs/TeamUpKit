//
//  TURequestError.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 25/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

public class TURequestError {
    
    // MARK: Types
    
    public enum Raw: Error {
        case unknown
    }
    
    // MARK: Properties
    
    let raw: Error
    let statusCode: TUResponse.StatusCode
    let detail: String?
    
    class var unknown: TURequestError {
        return TURequestError(raw: Raw.unknown, statusCode: .unknown)
    }
    
    // MARK: Init
    
    init(raw: Error?,
         statusCode: TUResponse.StatusCode,
         response: TUResponse?) {
        self.raw = raw ?? Raw.unknown
        self.statusCode = statusCode
        
        var details: ErrorDetail?
        if let data = response?.data {
            let decoder = JSONDecoder()
            do {
                details = try decoder.decode(ErrorDetail.self, from: data)
            } catch {}
        }
        self.detail = details?.detail
    }
    
    convenience init(raw: Error?,
                     statusCode: TUResponse.StatusCode) {
        self.init(raw: raw,
                  statusCode: statusCode,
                  response: nil)
    }
}

extension TURequestError: CustomStringConvertible {
    
    public var description: String {
        var description = ""
        description += "\(self.statusCode) (\(self.statusCode.rawValue)) -"
        if let detail = self.detail {
            description += " Reason: \(detail)"
        } else {
            description += " \(raw)"
        }
        return description
    }
}
