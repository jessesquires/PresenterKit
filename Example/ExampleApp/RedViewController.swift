//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//
//  Documentation
//  https://jessesquires.github.io/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: https://opensource.org/licenses/MIT
//

import PresenterKit
import UIKit

final class RedViewController: UITableViewController {

    let cellId = "cell"
    var dismissConfig: DismissButtonConfig?

    init(dismissConfig: DismissButtonConfig? = nil) {
        self.dismissConfig = dismissConfig
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Red View"
        tableView.backgroundColor = UIColor(red: 1.0, green: 0.493_3, blue: 0.474, alpha: 1.0)
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        let config = dismissConfig ?? DismissButtonConfig()
        addDismissButtonIfNeeded(config: config)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "cell \((indexPath as NSIndexPath).row)"
        cell.textLabel?.textColor = .red
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section title"
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer title"
    }
}
