//
//  MemoryFeedStore.swift
//  FeedStoreChallenge
//
//  Created by Damian Modernell on 18/3/2564 BE.
//  Copyright © 2564 Essential Developer. All rights reserved.
//

import Foundation

public final class MemoryFeedStore: FeedStore {
	
	private var cache: (feed: [LocalFeedImage],timestamp:  Date)?
	
	public init() {}
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		cache = nil
		completion(.none)
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		cache = (feed, timestamp)
		completion(nil)
	}
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		guard let cacheFeed = cache else {
			completion(.empty)
			return
		}
		completion(.found(feed: cacheFeed.feed, timestamp: cacheFeed.timestamp))
	}
}
