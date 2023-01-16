//
//  LoadingViewModifier.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            ProgressView()
                .isHidden(!isLoading)
                .scaleEffect(2)
        }
    }
}
