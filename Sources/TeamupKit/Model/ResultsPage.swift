//
//  ResultsPage.swift
//  TeamupKit
//
//  Created by Merrick Sapsford on 20/06/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import Foundation

/// A page of results within a number of pages.
public struct ResultsPage<T : Codable>: Codable {
    
    // MARK: Types
    
    public enum Index: String {
        case previous
        case next
    }
    
    enum CodingKeys: String, CodingKey {
        case count
        case nextPageUrl = "next"
        case nextPage = "next_page"
        case previousPageUrl = "previous"
        case previousPage = "previous_page"
        case currentPage = "current_page"
        case totalPageCount = "total_pages"
        case results
    }
    
    // MARK: Properties
    
    /// The number of results in the page.
    public let count: Int
    /// The url for the next page.
    public let nextPageUrl: URL?
    /// The index of the next page.
    public let nextPage: Int?
    /// The url for the previous page.
    public let previousPageUrl: URL?
    /// The index of the previous page.
    public let previousPage: Int?
    /// The index of the current page.
    public let currentPage: Int
    /// The total number of pages available.
    public let totalPageCount: Int
    
    /// The results in the page.
    public let results: [T]
    
    // MARK: Utility
    
    /// Get the Page URL for an index.
    ///
    /// - Parameter index: The index.
    /// - Returns: The page URL.
    internal func pageUrl(for index: Index) -> URL? {
        switch index {
        case .next:
            return nextPageUrl
        case .previous:
            return previousPageUrl
        }
    }
}
