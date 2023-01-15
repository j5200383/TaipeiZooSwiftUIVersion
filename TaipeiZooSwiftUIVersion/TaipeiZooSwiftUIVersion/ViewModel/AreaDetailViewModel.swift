//
//  AreaDetailViewModel.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import Foundation
import Combine

class AreaDetailViewModel: ObservableObject {
    @Published private (set) var animalInfos = [AnimalInfo]()
    @Published var isLoading = false
    private (set) var areaInfo: ZooAreaInfo?
    private var cancellable = Set<AnyCancellable>()
    
    init(areaInfo: ZooAreaInfo? = nil) {
        self.areaInfo = areaInfo
    }
    
    func getData() {
        isLoading = true
        APIManager.shared.getAnimalInfo()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {[weak self] completion in
                if case .failure(let error) = completion {
//                    self?.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                }
                self?.isLoading = false
            }, receiveValue: {[weak self] data in
                self?.animalInfos = data.filter({$0.location == self?.areaInfo?.name})
            })
            .store(in: &cancellable)
    }

}
