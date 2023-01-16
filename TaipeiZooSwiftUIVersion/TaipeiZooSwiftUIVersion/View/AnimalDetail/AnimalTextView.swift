//
//  AnimalTextView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct AnimalTextView: View {
    var title: String
    var detail: String
    var padding: CGFloat = 32
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(detail)
                .font(.body)
            Spacer(minLength: padding)
        }
    }
}

struct AnimalTextView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalTextView(title: "大熊貓", detail: "熊貓")
    }
}
