//
//  ViewController.swift
//  CollectionView_SizeClass
//
//  Created by EvgeniiChistyakov on 21.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var dataSource = ["Apple", "Apple", "MacOS", "Apple", "Apple", "MacOS",  "Apple", "MacOS", "MacOS", "Apple", "Apple", "MacOS", "MacOS", "Apple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PortraitViewCell.reuseIndetifier, bundle: nil), forCellWithReuseIdentifier: PortraitViewCell.reuseIndetifier)
        collectionView.register(UINib(nibName: LandscapeViewCell.reuseIndetifier, bundle: nil), forCellWithReuseIdentifier: LandscapeViewCell.reuseIndetifier)
        
        
        if let layout = collectionView.collectionViewLayout as? CustomLayout {
            layout.layoutDelegate = self
            layout.currentTrait = traitCollection
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard previousTraitCollection != nil else { return }
        if let customLayout = collectionView.collectionViewLayout as? CustomLayout {
            customLayout.currentTrait = traitCollection
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)

        coordinator.animate(alongsideTransition: { [unowned self] _ in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }) { [unowned self] _ in
            self.collectionView.reloadData()
        }
    }
}

extension ViewController: CustomLayoutDelegate {
    func heightFor(index: Int) -> CGFloat {
        if traitCollection.verticalSizeClass == .regular {
            return index % 3 == 0 ? 100 : 150
        } else {
            return index % 3 == 0 ? 120 : 180
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if traitCollection.verticalSizeClass == .regular {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PortraitViewCell.reuseIndetifier, for: indexPath) as? PortraitViewCell else { return .init() }
            let currentText = dataSource[indexPath.row]
            cell.configure(text: currentText,
                           image: UIImage(named: currentText == "Apple" ? "apple" : "macos"))
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandscapeViewCell.reuseIndetifier, for: indexPath) as? LandscapeViewCell else { return .init() }
            cell.configure(image: UIImage(named: dataSource[indexPath.row] == "Apple" ? "apple" : "macos"))
            return cell
        }
    }
}
