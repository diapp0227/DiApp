//
//  TimeCalcViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class TimeCalcViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationBar()
    }
}

private extension TimeCalcViewController {
    
    /// Tableviewの設定
    func setupTableView() {
        // Cellの登録
        tableView.register(UINib(nibName: "TimeCalcAddElementsCell", bundle: nil),
                           forCellReuseIdentifier: "TimeCalcAddElementsCell")
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
}

extension TimeCalcViewController: UITableViewDataSource {
    
    /// Sectionの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    /// 利用するCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TimeCalcAddElementsCell", for: indexPath)
    }
}

extension TimeCalcViewController: UITableViewDelegate {
    
    /// Cellタップ時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: "TimeCalcInput", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
