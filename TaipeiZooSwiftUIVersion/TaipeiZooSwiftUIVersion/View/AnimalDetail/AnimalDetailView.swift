//
//  AnimalDetailView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/10.
//

import SwiftUI

struct AnimalDetailView: View {
    var info: AnimalInfo
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    PicUrlImage(url: URL(string: info.picUrl))
                    
                    Group {
                        AnimalTextView(title: info.name, detail: info.enName)
                        AnimalTextView(title: "別名", detail: info.alsoknown)
                        AnimalTextView(title: "特徵", detail: info.feature)
                        AnimalTextView(title: "行為", detail: info.behavior)
                        Text("最後更新：\(info.update)")
                            .font(.headline)
                    }
                    .padding([.leading, .trailing], 16)
                }
            }
        }
        .navigationTitle(info.name)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animalInfo = AnimalInfo(name: "大熊貓", enName: "Giant Panda", alsoknown: "貓熊、熊貓", feature: "1.愛吃\n2.喜歡玩", behavior: "1.愛吃\n2.喜歡玩", location: "", picUrl: "", update: "2023/01/10")

    static var previews: some View {
        AnimalDetailView(info: animalInfo)
    }
}
