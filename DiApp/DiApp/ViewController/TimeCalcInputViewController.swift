//
//  TimeCalcInputViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/09/01.
//

import UIKit

class TimeCalcInputViewController: DiAppViewController {

    private let viewModel = TimeCalcInputViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
        setupTextField()
    }
    
    func setupInfo(entity: TimeCalcEntity?) {
        viewModel.initialDisplayEntity(entity: entity)
    }
}

private extension TimeCalcInputViewController {
    
    func setupTableView() {
        // Cellの登録
        viewModel.sections.forEach {
            tableView.register(UINib(nibName: $0.identifierName, bundle: nil),
                               forCellReuseIdentifier: $0.identifierName)
        }
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
    
    /// テキストフィールドの設定
    func setupTextField() {
        hideKeyboardWhenTappedAround()
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
            self?.saveTimeCalcEntity()
            self?.navigationController?.popViewController(animated: true)
            Logger.log("saveConfirmAlert Yes")
        })
        
        alert.addAction(UIAlertAction(title: "No", style: .destructive) { _ in
            Logger.log("saveConfirmAlert No")
        })
        return alert
    }
    
    func setupCell(indexPath: IndexPath, cell: UITableViewCell) -> UITableViewCell {
        switch viewModel.sections[indexPath.row] {
        case .date,
             .work,
             .leaving:
            return setupInputCell(cell, section: viewModel.sections[indexPath.row])
        case .memo, .remarks:
            return setupWritingCell(cell, section: viewModel.sections[indexPath.row])
        case .infoType:
            return setupInfoTypeCell(cell, section: viewModel.sections[indexPath.row])
        }
    }
                
    /// 各Cellの設定
    func setupInputCell(_ cell: UITableViewCell, section: TimeCalcInputViewModel.Section) -> UITableViewCell {
        guard let cell = cell as? TimeCalcInputCell else {
            return cell
        }
        cell.setContents(title: section.title,
                         mode: section.pickerMode,
                         date: viewModel.getFirstDisplayEntityDate(section: section))
        return cell
    }
    
    /// 各Cellの設定
    func setupWritingCell(_ cell: UITableViewCell, section: TimeCalcInputViewModel.Section) -> UITableViewCell {
        guard let cell = cell as? WritingTableViewCell else {
            return cell
        }
        cell.setup(title: viewModel.sections[section.rawValue].title)
        return cell
    }

    /// 各Cellの設定
    func setupInfoTypeCell(_ cell: UITableViewCell, section: TimeCalcInputViewModel.Section) -> UITableViewCell {
        guard let cell = cell as? InfoTypeTableViewCell else {
            return cell
        }
        cell.setup(self, title: section.title, didSelectRow: Int(viewModel.infoTypeSelectedNumber))
        return cell
    }
    
    func saveTimeCalcEntity() {
        switch viewModel.inputType {
        case .add:
            addTimeCalcEntity()
        case .edit:
            updateTimeCalcEntity()
        }
    }
    
    func addTimeCalcEntity() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let newEntity = TimeCalcEntity(context: appDelegate.persistentContainer.viewContext)
        processNewEntity(newEntity: newEntity)
        CoreDataRepository.shared.saveTimeCalcEntity()
    }
    
    func updateTimeCalcEntity() {
        guard let _ = UIApplication.shared.delegate as? AppDelegate,
              let beforeEntity = viewModel.editBeforeEntity else {
            return
        }
        processNewEntity(newEntity: beforeEntity)
        CoreDataRepository.shared.saveTimeCalcEntity()
    }
    
    func processNewEntity(newEntity: TimeCalcEntity) {
        newEntity.date = getSectionInfo(type: .date) as? Date
        newEntity.work = getSectionInfo(type: .work) as? Date
        newEntity.leaving = getSectionInfo(type: .leaving) as? Date
        newEntity.memo = getSectionInfo(type: .memo) as? String
        newEntity.infoType = getSectionInfo(type: .infoType) as? Int64 ?? .zero
    }
}

extension TimeCalcInputViewController: UITableViewDataSource {
    
    /// 表示要素の個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.sections[indexPath.row].cellForHeight
    }
    
    /// 利用するCellの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCell(indexPath: indexPath,
                         cell: tableView.dequeueReusableCell(withIdentifier: viewModel.sections[indexPath.row].identifierName,
                                                             for: indexPath))
    }
}

extension TimeCalcInputViewController: UITableViewDelegate { 
        
    func getSectionInfo(type: TimeCalcInputViewModel.Section) -> Any? {
        if let cell = tableView.cellForRow(at: IndexPath(row: type.rawValue, section: .zero)) as? TimeCalcInputCell {
            return cell.datePicker.date
        }
        
        if let cell = tableView.cellForRow(at: IndexPath(row: type.rawValue, section: .zero)) as? WritingTableViewCell {
            return cell.textField.text
        }
        
        if let _ = tableView.cellForRow(at: IndexPath(row: type.rawValue, section: .zero)) as? InfoTypeTableViewCell {
            return viewModel.infoTypeSelectedNumber
        }
        return nil
    }
}

extension TimeCalcInputViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.infoTypeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.infoTypeSelectedNumber = Int64(row)
    }
}

extension TimeCalcInputViewController: UIPickerViewDataSource {
    /// 列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    /// 行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.infoTypeList.count
    }
    
}
