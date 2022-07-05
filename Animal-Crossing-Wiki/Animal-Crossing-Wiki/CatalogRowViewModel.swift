//
//  CatalogRowViewModel.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/07/05.
//

import Foundation
import RxSwift
import RxRelay

final class CatalogRowViewModel {
    
    private let item: Item
    private let category: Category
    private let storage: ItemsStorage
    
    init(
        item: Item,
        category: Category,
        storage: ItemsStorage = CoreDataItemsStorage()
        
    ) {
        self.item = item
        self.category = category
        self.storage = storage
    }
    
    struct Input {
        let didTapCheck: Observable<Void>
    }
    
    struct Output {
        let isAcquired: Observable<Bool>
    }
    
    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let isAcquired = BehaviorRelay<Bool>(value: false)
        
        input.didTapCheck
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                Items.shared.updateItem(owner.item)
                owner.storage.update(owner.item)
            }).disposed(by: disposeBag)
        
        Items.shared.itemList
            .subscribe(onNext: { items in
                isAcquired.accept(items.contains(where: { $0.name == self.item.name && $0.isFake == self.item.isFake }))
            }).disposed(by: disposeBag)
        
        return Output(
            isAcquired: isAcquired.asObservable()
        )
    }
    
}
