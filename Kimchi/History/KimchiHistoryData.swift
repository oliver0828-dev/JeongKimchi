//
//  KimchiHistoryData.swift
//  Kimchi
//
//  Created by Oliver Park on 12/26/24.
//

import Foundation
import SwiftData

struct TopFiveKimchiHistoryData: Identifiable {
    let id = UUID()
    var kimchiName: String
    var kimchiKoreanName: String
    var kimchiOriginLocation: String
    var kimchiOriginLongitude: Double
    var kimchiOriginLatitude: Double
    var kimchiDescription: String  // Added description for detailed historical and cultural insights
}

struct KimchiHistoryDataList {
    static let TopFiveKimchiHistoryDataList: [TopFiveKimchiHistoryData] = [
        TopFiveKimchiHistoryData(
            kimchiName: "Cabbage Kimchi",
            kimchiKoreanName: "배추김치",
            kimchiOriginLocation: "Northern Korea",
            kimchiOriginLongitude: 126.9784,
            kimchiOriginLatitude: 37.5665,
            kimchiDescription: "Baechu Kimchi, the most famous variety, evolved in the Joseon Dynasty after chili peppers were introduced in the 16th century. It is made with Napa cabbage, gochugaru (red pepper flakes), garlic, and fish sauce, and is often fermented for weeks to develop deep flavors."
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "White Kimchi",
            kimchiKoreanName: "백김치",
            kimchiOriginLocation: "Gangwon-do",
            kimchiOriginLongitude: 128.1555,
            kimchiOriginLatitude: 37.8228,
            kimchiDescription: "Baek Kimchi is a non-spicy variety originating from colder regions like Gangwon-do, where milder flavors are preferred. It is made without red pepper flakes, relying on pear, radish, and jujubes for a naturally sweet and tangy taste."
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Cubed Radish Kimchi",
            kimchiKoreanName: "깍두기",
            kimchiOriginLocation: "Joseon Dynasty",
            kimchiOriginLongitude: 127.0246,
            kimchiOriginLatitude: 37.5326,
            kimchiDescription: "Kkakdugi is a type of kimchi made with diced radish, widely popular since the Joseon Dynasty. The crunchy texture and refreshing taste make it a perfect side dish for dishes like seolleongtang (ox bone soup)."
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Ponytail Radish Kimchi",
            kimchiKoreanName: "총각김치",
            kimchiOriginLocation: "Jeolla-do",
            kimchiOriginLongitude: 126.9997,
            kimchiOriginLatitude: 35.8257,
            kimchiDescription: "Chonggak Kimchi is named after its radish shape resembling a traditional Korean topknot hairstyle. It is common in Jeolla-do, a region known for its bold and spicy flavors, and is fermented with its leaves intact for added depth."
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Stuffed Kimchi",
            kimchiKoreanName: "보쌈김치",
            kimchiOriginLocation: "Gyeongsang Province",
            kimchiOriginLongitude: 128.6035,
            kimchiOriginLatitude: 35.8714,
            kimchiDescription: "Bossam Kimchi is a luxurious variety where cabbage leaves are stuffed with ingredients like oysters, chestnuts, and pine nuts. It is associated with royal cuisine and often prepared during special occasions."
        )
    ]
}
