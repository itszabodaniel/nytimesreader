//
//  ArticleDetailViewController.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class ArticleDetailViewController: UIViewController, ArticleDetailView {
	
	@IBOutlet weak var webView: WKWebView!
	var presenter: ArticleDetailPresenter!
	
	var url: URL? {
		didSet {
			if let url = url {
				presenter?.setDetailURL(url: url)
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = ArticleDetailPresenter(view: self)
		if let url = url {
			presenter.setDetailURL(url: url)
		}
		webView.navigationDelegate = self
	}
	
	func loadURL(url: URL) {
		webView.load(URLRequest(url: url))
	}
	
	
	func showLoadingIndicator() {
		MBProgressHUD.showAdded(to: self.view, animated: false)
	}
	
	func hideLoadingIndicator() {
		MBProgressHUD.hide(for: self.view, animated: false)
	}
}

extension ArticleDetailViewController: WKNavigationDelegate {
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		presenter.loadingCompleted()
	}
}
