//
//  Article.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import Foundation

class Article: Codable {
	let id: Int
	let title: String
	let byline: String
	let publishDateString: String
	let url: URL
	let media: [Media]
	
	init(id: Int, title: String, byline: String, publishDateString: String, url: URL, media: [Media]) {
		self.id = id
		self.title = title
		self.byline = byline
		self.publishDateString = publishDateString
		self.url = url
		self.media = media
	}
	
	enum ArticleKeys: CodingKey {
		case id, title, byline, published_date, url, media
	}
	
	convenience required init(from decoder: Decoder) throws {
		let c = try decoder.container(keyedBy: ArticleKeys.self)
		let id = try c.decode(Int.self, forKey: .id)
		let title = try c.decode(String.self, forKey: .title)
		let byline = try c.decode(String.self, forKey: .byline)
		let publishDateString = try c.decode(String.self, forKey: .published_date)
		let url = try c.decode(URL.self, forKey: .url)
		let media = try? c.decode([Media].self, forKey: .media)
		self.init(id: id, title: title, byline: byline, publishDateString: publishDateString, url: url, media: media ?? [])
	}
	
	func imageURL() -> URL? {
		let firstMedia = media.first
		let metadatas = firstMedia?.mediaMetadata ?? []
		for metadata in metadatas {
			if metadata.format == "Standard Thumbnail" {
				return metadata.url
			}
		}
		return metadatas.first?.url
	}
}

class Media: Codable {
	let type: String
	let subtype: String
	let mediaMetadata: [MediaMetadata]
	
	enum MediaKeys: String, CodingKey {
		case type
		case subtype
		case mediaMetadata = "media-metadata"
	}
	
	init(type: String, subtype: String, mediaMetadata: [MediaMetadata]) {
		self.type = type
		self.subtype = subtype
		self.mediaMetadata = mediaMetadata
	}
	
	convenience required init(from decoder: Decoder) throws {
		let c = try decoder.container(keyedBy: MediaKeys.self)
		let type = try c.decode(String.self, forKey: .type)
		let subtype = try c.decode(String.self, forKey: .subtype)
		let mediaMetadata = try c.decode([MediaMetadata].self, forKey: .mediaMetadata)
		self.init(type: type, subtype: subtype, mediaMetadata: mediaMetadata)
	}
}

class MediaMetadata: Codable {
	let url: URL
	let format: String
	let height: Int
	let width: Int
	
	init(url: URL, format: String, height: Int, width: Int) {
		self.url = url
		self.format = format
		self.height = height
		self.width = width
	}
}

extension Article: CustomStringConvertible {
	var description: String {
		get {
			return "id: " + String(id) + ", title: " + title + "\n"
		}
	}
}

// MARK: Equatable

extension Article: Equatable {
	public static func == (lhs: Article, rhs: Article) -> Bool {
		return lhs.id == rhs.id &&
			lhs.title == rhs.title &&
			lhs.byline == rhs.byline &&
			lhs.publishDateString == rhs.publishDateString &&
			lhs.url == rhs.url &&
			lhs.media == rhs.media
	}
}

extension Media: Equatable {
	public static func == (lhs: Media, rhs: Media) -> Bool {
		return 	lhs.type == rhs.type &&
			lhs.subtype == rhs.subtype &&
			lhs.mediaMetadata == rhs.mediaMetadata
	}
}

extension MediaMetadata: Equatable {
	public static func == (lhs: MediaMetadata, rhs: MediaMetadata) -> Bool {
		return 	lhs.url == rhs.url &&
		lhs.format == rhs.format &&
		lhs.height == rhs.height &&
		lhs.width == rhs.width
	}
}
