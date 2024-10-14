//
//  TimeCalcViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class TimeCalcViewController: DiAppViewController {
    
    let viewModel = TimeCalcViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateEntityData()
        tableView.reloadData()
        
        Logger.log("CoreDataRepository.shared.getTimeCalcEntity().count = \(CoreDataRepository.shared.getTimeCalcEntity().count)")
        
        CoreDataRepository.shared.getTimeCalcEntity().forEach { info in
            Logger.log("info = \(info)")
        }
    }
}

private extension TimeCalcViewController {
    
    /// Tableviewの設定
    func setupTableView() {
        // Cellの登録
        TimeCalcViewModel.Section.allCases.forEach {
            tableView.register(UINib(nibName: $0.identifierName, bundle: nil),
                               forCellReuseIdentifier: $0.identifierName)
        }
        // dataSource・delegateを紐付け
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupNavigationBar() {
        navigationItem.title = "時間計算"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                            target: self,
                                                            action: #selector(tapNavigationClose))
        
    }
    
    @objc func tapNavigationClose(_ sender : Any) {
        dismiss(animated: true)
    }
    
    func setupCell(indexPath: IndexPath, cell: UITableViewCell) -> UITableViewCell {
        switch viewModel.section[indexPath.section] {
        case .entity:
            return setupEntityCell(indexPath: indexPath, cell: cell)
        case .addButton:
            return cell
        }
    }
    
    func setupEntityCell(indexPath: IndexPath, cell: UITableViewCell) -> UITableViewCell {
        guard let entityCell = cell as? TimeCalcTableViewCell else {
            return cell
        }
        entityCell.setup(entity: viewModel.getTimeCalcEntity(number: indexPath.row))
        return entityCell
    }
    
}

extension TimeCalcViewController: UITableViewDataSource {
    
    /// Sectionの個数
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.section.count
    }
    
    /// 各Sectionの要素数(行数)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.section[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    /// 利用するCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setupCell(indexPath: indexPath,
                             cell: tableView.dequeueReusableCell(withIdentifier: viewModel.section[indexPath.section].identifierName,
                                                                 for: indexPath))
        return cell
    }
}

extension TimeCalcViewController: UITableViewDelegate {
    
    /// Cellタップ時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = TimeCalcInputViewController.initialNavigationController(),
              let inputViewController = vc as? TimeCalcInputViewController else {
            return
        }
        // 初期表示の情報を判別
        switch viewModel.section[indexPath.section] {
        case .entity:
            inputViewController.setupInfo(entity: viewModel.getTimeCalcEntity(number: indexPath.row))
        case .addButton:
            break
        }
        
        navigationController?.pushViewController(inputViewController, animated: true)
    }
}
