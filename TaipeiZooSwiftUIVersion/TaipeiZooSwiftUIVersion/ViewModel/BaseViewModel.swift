//
//  BaseViewModel.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String?
    var cancellable = Set<AnyCancellable>()
}
