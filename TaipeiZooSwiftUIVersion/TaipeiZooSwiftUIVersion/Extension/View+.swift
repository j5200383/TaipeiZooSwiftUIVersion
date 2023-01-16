//
//  View+.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

extension View {
    @ViewBuilder
    func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
    
    func errorAlert(message: Binding<String?>) -> some View {
        ModifiedContent(content: self, modifier: ErrorAlertViewModifier(errorMessage: message))
    }
    
    func loadingView(isLoading: Bool) -> some View {
        ModifiedContent(content: self, modifier: LoadingViewModifier(isLoading: isLoading))
    }
}
