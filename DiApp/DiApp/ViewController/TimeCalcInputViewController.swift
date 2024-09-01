//
//  TimeCalcInputViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/01.
//

import UIKit

class TimeCalcInputViewController: UIViewController {

    private let viewModel = TimeCalcInputViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}

private extension TimeCalcInputViewController {
    
    func setupTableView() {
        // Cellの登録
        tableView.register(UINib(nibName: "TimeCalcInputCell", bundle: nil),
                           forCellReuseIdentifier: "TimeCalcInputCell")
        // dataSource・delegateを紐付け
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /// 各Cellの設定
    func setupInputCell(_ cell: UITableViewCell, section: TimeCalcInputViewModel.Section) {
        guard let cell = cell as? TimeCalcInputCell else {
            return
        }
        cell.setContents(title: section.title, mode: section.pickerMode)
    }
    
}

extension TimeCalcInputViewController: UITableViewDataSource {
    
    /// Sectionの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections.count
    }
    
    /// 利用するCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCalcInputCell", for: indexPath)
        setupInputCell(cell, section: viewModel.sections[indexPath.row])
        return cell
    }
}

extension TimeCalcInputViewController: UITableViewDelegate { }
