//
//  FirstLaunchViewController.swift
//  DiApp
//
//  Created by garigari0118 on 2024/08/31.
//

import UIKit

class FirstLaunchViewController: UIViewController {

    private let viewModel = FirstLaunchViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDestination()
        collectionView.register(UINib(nibName: "FirstLaunchCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "FirstLaunchCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 256, height: 256)
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func tapTimeCalcAction(_ sender: Any) {
        presentViewController()
    }
        
}

private extension FirstLaunchViewController {
    
    func updateDestination() {
        collectionView.reloadData()
        
        titleLabel.text = viewModel.destinationList[viewModel.selectedDestination].title
        explanationLabel.text = viewModel.destinationList[viewModel.selectedDestination].explanation
    }
    
    func presentViewController() {
        guard let viewController = viewModel.destinationList[viewModel.selectedDestination].viewController else {
            return
        }
        present(viewController, animated: true)
    }
}

extension FirstLaunchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setSelectedDestination(indexPath.row)
        updateDestination()
    }
}

extension FirstLaunchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.destinationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstLaunchCollectionViewCell", for: indexPath)
        if let cell = cell as? FirstLaunchCollectionViewCell {
            cell.setup(image: viewModel.destinationList[indexPath.row].image)
            let isSelect = indexPath.row == viewModel.selectedDestination
            cell.updateColor(isSelect)
        }
        return cell
    }
}
