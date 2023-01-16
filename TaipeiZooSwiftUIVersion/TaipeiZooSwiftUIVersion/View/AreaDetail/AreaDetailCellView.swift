//
//  AnimalDetailCellView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct AreaDetailCellView: View {
    var animalInfo: AnimalInfo
    
    var body: some View {
        HStack(spacing: 16) {
            PicUrlImage(url: URL(string: animalInfo.picUrl))
                .frame(width: 150, height: 100)
                .cornerRadius(6)

            VStack(alignment: .leading) {
                Text(animalInfo.name)
                    .font(.headline)
                Text(animalInfo.alsoknown)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}
struct AnimalDetailCellView_Previews: PreviewProvider {
    static let animalInfo = AnimalInfo(name: "大熊貓", enName: "Giant Panda", alsoknown: "貓熊、熊貓", feature: "1.愛吃\n2.喜歡玩", behavior: "1.愛吃\n2.喜歡玩", location: "", picUrl: "http://www.zoo.gov.tw/iTAP/05_Exhibit/14_PandaHouse.jpg", update: "2023/01/10")

    static var previews: some View {
        AreaDetailCellView(animalInfo: animalInfo)
    }
}
