//
//  ArticleListViewController.swift
//  NYTimesReader
//
//  Created by Szabó Dániel on 2018. 05. 21..
//  Copyright © 2018. Szabó Dániel. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController, ArticleListView {
	var detailViewController: ArticleDetailViewController? = nil
	var presenter: ArticleListPresenter!

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
		    if let indexPath = tableView.indexPathForSelectedRow {
		        let controller = (segue.destination as! UINavigationController).topViewController as! ArticleDetailViewController
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
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

	func refreshArticlesList() {
		self.tableView.reloadData()
	}
	
	func showLoadingIndicator() {
		
	}
	
	func hideLoadingIndicator() {
		
	}
	
	func showDetailWithURL(url: URL) {
		
	}
}

