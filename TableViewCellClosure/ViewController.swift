//
//  ViewController.swift
//  TableViewCellClosure
//
//  Created by 坂本龍哉 on 2021/11/11.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var numbers = [0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(TableViewCell.nib,
                           forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        numbers.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        else { return UITableViewCell() }
        cell.configure(number: numbers[indexPath.row],
                       didchangeCountUpValue: { [weak self] number in
            self?.numbers[indexPath.row] = number + 1
            self?.tableView.reloadRows(at: [indexPath], with: .none)
        })
        return cell
    }
    
}

