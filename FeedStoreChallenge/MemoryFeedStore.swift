//
//  MemoryFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Damian Modernell on 18/3/2564 BE.
//  Copyright © 2564 Essential Developer. All rights reserved.
//

import Foundation

public final class MemoryFeedStore: FeedStore {
	
	private var feedCache: ([LocalFeedImage], Date) = ([], Date())
	
	public init() {}
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		feedCache = ([], Date())
		completion(.none)
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		feedCache = (feed, timestamp)
		completion(nil)
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		let (cachedFeeed, timestamp) = (feedCache.0, feedCache.1)
		if cachedFeeed.isEmpty {
			completion(.empty)
		} else {
			completion(.found(feed: cachedFeeed, timestamp: timestamp))
		}
	}
}
