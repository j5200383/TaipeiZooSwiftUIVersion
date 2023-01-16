//
//  AnimalAreaCell.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2023/1/16.
//

import SwiftUI

struct AnimalAreaCell: View {
    var data: ZooAreaInfo
    
    var body: some View {
        HStack(spacing: 16) {
            PicUrlImage(url: URL(string: data.picUrl))
                .frame(width: 150, height: 100)
                .cornerRadius(6)

            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.headline)
                Text(data.info)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

struct AnimalAreaCell_Previews: PreviewProvider {
    static var previews: some View {
        let data = ZooAreaInfo(name: "新光特展館（大貓熊館）", picUrl: "http://www.zoo.gov.tw/iTAP/05_Exhibit/14_PandaHouse.jpg", info: "新光特展館 (大貓熊館) 包括一個戶外展示場和兩個室內展示館。\n戶外展示場模擬大貓熊野外棲息地，草坪寬闊，並以濃綠喬木構成背景，還有大小石塊及流瀑水池，提供動物活動空間及攀爬、遮陰設施。室內展示館則具有空調設備，夏天以空調調控溫濕度；冬天則採自然通風，讓大貓熊們住得既舒服又健康。")
        AnimalAreaCell(data: data)
    }
}
