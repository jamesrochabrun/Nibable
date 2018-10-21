//
//  GenericCollectionViewDataSource.swift
//  Nibable
//
//  Created by James Rochabrun on 10/20/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//final class GenericCollectionViewDataSource<V, T>: NSObject, UICollectionViewDataSource where V: BaseCollectionViewCell<T> {

final class GenericCollectionViewDataSource<V, T>: NSObject, UICollectionViewDataSource where V: UICollectionViewCell {
    
    private var models: [T]
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (V, T) -> V
    private var searchResults: [T] = []
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: V = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let model = getModelAt(indexPath)
        return configureCell(cell, model)
    }
    
    private func getModelAt(_ indexPath: IndexPath) -> T {
        return models[indexPath.item]
    }
    
    func shuffle() {
        self.models.shuffle()
    }
}

