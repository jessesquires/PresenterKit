//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit

import PresenterKit


final class RedViewController: UITableViewController {

    let cellId = "cell"

    init() {
        super.init(style: .Grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Red View"
        tableView.backgroundColor = UIColor(red: 1.0, green: 0.4933, blue: 0.474, alpha: 1.0)
        tableView.allowsSelection = false
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        addDismissButtonIfNeeded()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row)"
        cell.textLabel?.textColor = .redColor()
        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section title"
    }

    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer title"
    }

}
