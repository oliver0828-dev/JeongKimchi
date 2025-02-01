//
//  KimchiHistoryData.swift
//  Kimchi
//
//  Created by Oliver Park on 12/26/24.
//

import Foundation
import SwiftData

@Model
class TopFiveKimchiHistoryData: Identifiable {
    var kimchiName: String
    var kimchiKoreanName: String
    var kimchiOriginLocation: String
    var kimchiOriginLongitude: Double
    var kimchiOriginLatitude: Double
    
    init(kimchiName: String, kimchiKoreanName: String, kimchiOriginLocation: String, kimchiOriginLongitude: Double, kimchiOriginLatitude: Double) {
        self.kimchiName = kimchiName
        self.kimchiKoreanName = kimchiKoreanName
        self.kimchiOriginLocation = kimchiOriginLocation
        self.kimchiOriginLongitude = kimchiOriginLongitude
        self.kimchiOriginLatitude = kimchiOriginLatitude
    }
}


struct KimchiHistoryDataList {
    static let TopFiveKimchiHistoryDataList: [TopFiveKimchiHistoryData] = [
        TopFiveKimchiHistoryData(
            kimchiName: "Cabbage Kimchi",
            kimchiKoreanName: "배추김치",
            kimchiOriginLocation: "Northern Korea",
            kimchiOriginLongitude: 126.9784,
            kimchiOriginLatitude: 37.5665
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "White Kimchi",
            kimchiKoreanName: "백김치",
            kimchiOriginLocation: "Gangwon-do",
            kimchiOriginLongitude: 128.1555,
            kimchiOriginLatitude: 37.8228
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Cubed Radish Kimchi",
            kimchiKoreanName: "깍두기",
            kimchiOriginLocation: "Joseon Dynasty",
            kimchiOriginLongitude: 127.0246,
            kimchiOriginLatitude: 37.5326
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Ponytail Radish Kimchi",
            kimchiKoreanName: "총각김치",
            kimchiOriginLocation: "Jeolla-do",
            kimchiOriginLongitude: 126.9997,
            kimchiOriginLatitude: 35.8257
        ),
        TopFiveKimchiHistoryData(
            kimchiName: "Stuffed Kimchi",
            kimchiKoreanName: "보쌈김치",
            kimchiOriginLocation: "Gyeongsang Province",
            kimchiOriginLongitude: 128.6035,
            kimchiOriginLatitude: 35.8714
        )
    ]
}
