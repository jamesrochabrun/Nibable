//
//  Reusable.swift
//  Nibable
//
//  Created by James Rochabrun on 10/20/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {}

//MARK: protocol extension constrained to UICollectionViewCell
extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: Reusable {}

extension UICollectionView {
    
    typealias DataSourceCompletionHandler = () -> ()
    func registerDataSource<T: UICollectionViewDataSource>(_ _dataSource: T, completion: @escaping DataSourceCompletionHandler) {
        dataSource = _dataSource
        completion()
    }
    
    func register<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(_ :T.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("could not dequeue cell")
        }
        return cell
    }
    
    func registerHeader<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNibHeader<T: UICollectionViewCell>(_ : T.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueSuplementaryView<T: UICollectionViewCell>(of kind: String, at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("could not dequeue cell")
        }
        return cell
    }
    
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        return cellForItem(at: indexPath) as! T
    }
}

extension Bundle {
    
    static func loadNib<T: UIView>(_ :T.Type, owner: Any?, options: [UINib.OptionsKey  : Any]? = nil) -> T {
        return main.loadNibNamed(T.reuseIdentifier, owner: owner, options: options)?.first as! T
    }
}


