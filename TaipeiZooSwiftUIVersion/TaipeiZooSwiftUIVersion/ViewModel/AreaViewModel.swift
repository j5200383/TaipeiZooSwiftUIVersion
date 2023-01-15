//
//  AreaViewModel.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import Foundation
import Combine

class AreaViewModel: ObservableObject {
    @Published private (set) var zooAreaInfos = [ZooAreaInfo]()
    @Published private (set) var isLoading = false
    @Published private (set) var errorMessage: String?
    private var cancellable = Set<AnyCancellable>()
    
    func getData() {
        isLoading = true
        APIManager.shared.getAreaInfo()
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            } receiveValue: {[weak self] data in
                guard let `self` = self else {return}
                self.zooAreaInfos = data
            }
            .store(in: &cancellable)
    }
}
