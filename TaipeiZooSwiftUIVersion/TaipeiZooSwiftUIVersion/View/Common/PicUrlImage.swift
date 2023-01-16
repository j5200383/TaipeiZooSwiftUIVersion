//
//  PicUrlImage.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct PicUrlImage: View {
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url, content: { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .transition(.slide)
            case .empty:
                ZStack {
                    Color.purple.opacity(0.1)
                    ProgressView()
                }
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        })
    }
}
