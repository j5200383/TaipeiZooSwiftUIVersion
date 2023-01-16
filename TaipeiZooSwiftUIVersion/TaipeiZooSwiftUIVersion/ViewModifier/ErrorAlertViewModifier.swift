//
//  ErrorAlertViewModifier.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct ErrorAlertViewModifier: ViewModifier {
    @Binding var errorMessage: String?

    func body(content: Content) -> some View {
        content
            .alert(errorMessage ?? "", isPresented: .constant(errorMessage != nil)) {
                Button(role: .cancel) {
                    
                } label: {
                    Text("確認")
                }
            }
    }
}
