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
        setupNavigationBar()
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
    
    /// ナビゲーションバーの設定
    func setupNavigationBar() {
        navigationItem.title = "時間入力"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(tapNavigationEdit))
    }
    
    @objc func tapNavigationEdit(_ sender : Any) {
        present(saveConfirmAlert, animated: true)
    }
    
    /// ナビゲーションバー右上のボタン押下時に表示するダイアログ
    var saveConfirmAlert: UIAlertController {
        let alert = UIAlertController(title: "情報を保存しますか？",
                                      message: "",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(UIAlertAction(title: "No", style: .destructive) { _ in
            Logger.log("No")
        })
        return alert
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
