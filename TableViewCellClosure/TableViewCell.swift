//
//  TableViewCell.swift
//  TableViewCellClosure
//
//  Created by 坂本龍哉 on 2021/11/11.
//

import UIKit

final class TableViewCell: UITableViewCell {

    @IBOutlet private weak var numberLabel: UILabel!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    // クロージャを保持する
    private var didchangeCountUpHandler: (Int) -> Void = { _ in }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction private func plusButtonDidTapped(_ sender: Any) {
        didchangeCountUpHandler(Int(numberLabel.text!) ?? 0)
    }
    
    func configure(number: Int, didchangeCountUpValue: @escaping (Int) -> Void) {
        numberLabel.text = String(number)
        // 引数に１足して、tableViewをreloadRowsするクロージャが引数として渡されるので、それをdidchangeCountUpHandlerに保持する。
        didchangeCountUpHandler = didchangeCountUpValue
    }
    
}
