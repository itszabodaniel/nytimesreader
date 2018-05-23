//
//  ArticleListViewController.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import UIKit
import MBProgressHUD

class ArticleListViewController: UITableViewController, ArticleListView {
	var detailViewController: ArticleDetailViewController? = nil
	var presenter: ArticleListPresenter!
	var detailURL: URL?
	var detailTitle: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ArticleDetailViewController
		}
		presenter = ArticleListPresenter(view: self)
		presenter.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}
	
	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
			let controller = (segue.destination as! UINavigationController).topViewController as! ArticleDetailViewController
			controller.url = detailURL
			controller.title = detailTitle
		}
	}

	// MARK: - Table View

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.numberOfArticles()
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell")
		if cell == nil {
			cell = Bundle.main.loadNibNamed("ArticleTableViewCell", owner: nil, options: nil)?.first as? UITableViewCell
		}
		presenter.configure(cell: cell as! ArticleTableViewCell, row: indexPath.row)
		return cell!
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.didSelect(row: indexPath.row)
	}
	
	func refreshArticlesList() {
		self.tableView.reloadData()
	}
	
	func showLoadingIndicator() {
		MBProgressHUD.showAdded(to: self.view, animated: false)
	}
	
	func hideLoadingIndicator() {
		MBProgressHUD.hide(for: self.view, animated: false)
	}
	
	func showErrorDialog(error: Error) {
		let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Reload", style: .default, handler: { (action) in
			self.presenter.refreshArticles()
		}))
		self.present(alert, animated: true, completion: nil)
	}
	
	func showDetailWithURL(url: URL, title: String) {
		detailURL = url
		detailTitle = title
		self.performSegue(withIdentifier: "showDetail", sender: self)
	}
}

