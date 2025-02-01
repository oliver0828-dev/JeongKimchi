//
//  Kimchi Location Struct.swift
//  Kimchi
//
//  Created by Oliver Park on 12/19/24.
//

import Foundation
import SwiftUI
import SwiftData


struct KimchiLocationData: Identifiable {
    let id = UUID()
    var address: String
    var name: String
    var translateName: String // New variable for translated name
    var spiceLevel: Int
    var latitude: Double
    var longitude: Double
    var kimchiType: String
    
    var isFavorite: Bool {
        get {
            UserDefaults.standard.bool(forKey: "\(name)_favorite")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(name)_favorite")
        }
    }
}

struct KimchiLocationList {
    static let kimchiLocations = [
        // Cabbage Kimchi
        KimchiLocationData(address: "181-37, Dohwa-dong Mapo-gu, Seoul 04168 South Korea", name: "마포 양지설렁탕", translateName: "Mapo Yangji Seolleongtang", spiceLevel: 2, latitude: 37.538639, longitude: 126.949243, kimchiType: "Cabbage Kimchi"),
        
        KimchiLocationData(address: "1132-4, Ingye-dong, Paldal-gu, Suwon-si, Gyeonggi-do 16491 South Korea", name: "유치회관 본점", translateName: "Yuchi Restaurant Main Branch", spiceLevel: 2, latitude: 37.268208, longitude: 127.029380, kimchiType: "Cabbage Kimchi"),
        
        KimchiLocationData(address: "18-85 Euljiro 6-ga, Jung-gu, Seoul, South Korea", name: "대화정 진짜해장국", translateName: "Daehwajeong Jinjjahaejangguk", spiceLevel: 1, latitude: 37.567190, longitude: 127.006460, kimchiType: "Cabbage Kimchi"),
        
        KimchiLocationData(address: "226-30 Gyomun-dong, Guri-si, Gyeonggi-do, South Korea", name: "잉꼬칼국수", translateName: "Inggokal Guksu", spiceLevel: 3, latitude: 37.587574, longitude: 127.127528, kimchiType: "Cabbage Kimchi"),
        
        KimchiLocationData(address: "132-29 Yeonhui-dong, Seodaemun-gu, Seoul, South Korea", name: "연희동칼국수", translateName: "Yeonhui-dong Kalguksu", spiceLevel: 2, latitude: 37.572340, longitude: 126.930840, kimchiType: "Cabbage Kimchi"),
        
        // White Kimchi
        KimchiLocationData(address: "10 Baekchon 1-gil, Toseong-myeon, Goseong-gun, Gangwon-do, South Korea", name: "백촌막국수 고성", translateName: "Baekchon Makguksu Goseong", spiceLevel: 1, latitude: 38.207971, longitude: 128.493909, kimchiType: "White Kimchi"),
        
        KimchiLocationData(address: "48 Daehak-ro 8ga-gil, Jongro District, Seoul, South Korea", name: "촌놈 대학로", translateName: "Chonnom Daehakro", spiceLevel: 1, latitude: 37.582960, longitude: 126.999530, kimchiType: "White Kimchi"),
        
        KimchiLocationData(address: "4 Cheongpa-ro 51-gil, Yongsan District, Seoul, South Korea", name: "상록수 숙대입구", translateName: "Sangnoksoo Sookdaeipgu", spiceLevel: 1, latitude: 37.545801, longitude: 126.967124, kimchiType: "White Kimchi"),
        
        KimchiLocationData(address: "228 Jangsan-ri, Ganghyeon-myeon, Yangyang-gun, Gangwon-do, South Korea", name: "실로암 메밀국수", translateName: "Siloam Buckwheat Noodles", spiceLevel: 1, latitude: 38.137135, longitude: 128.590249, kimchiType: "White Kimchi"),
        
        KimchiLocationData(address: "70 Naruteo-ro, Seocho District, Seoul", name: "신사고집", translateName: "Sinsago Jib", spiceLevel: 1, latitude: 37.51531, longitude: 127.0176996, kimchiType: "White Kimchi"),
        
        // Radish Kimchi
        KimchiLocationData(address: "468 Jungnim-dong, Jung District, Seoul, South Korea", name: "중림장설렁탕", translateName: "Jungnimjang Seolleongtang", spiceLevel: 2, latitude: 37.5602641, longitude: 126.9677073, kimchiType: "Cubed Radish Kimchi"),
        
        KimchiLocationData(address: "Yeomni-dong, Baekbeom-ro 152, Seoul, South Korea", name: "곰탕반", translateName: "Gomtangban", spiceLevel: 2, latitude: 37.5452522, longitude: 126.9470308, kimchiType: "Cubed Radish Kimchi"),
        
        KimchiLocationData(address: "256-20 Gongdeok-dong, Mapo-gu, Seoul, South Korea", name: "영광보쌈", translateName: "Yeong-Guang Bossam", spiceLevel: 2, latitude: 37.549927, longitude: 126.9592897, kimchiType: "Cubed Radish Kimchi"),
        
        KimchiLocationData(address: "91-3 Donggeum-dong, Sacheon-si, Gyeongsangnam-do, South Korea", name: "서울깍두기", translateName: "Seoul Ggakdugi", spiceLevel: 3, latitude: 34.9308502, longitude: 128.0813337, kimchiType: "Cubed Radish Kimchi"),
        
        KimchiLocationData(address: "173 Mapo-daero, Ahyeon-dong, Mapo-gu, Seoul, South Korea", name: "남미식당", translateName: "Nami-Sikdang", spiceLevel: 2, latitude: 37.549901, longitude: 126.9544499, kimchiType: "Cubed Radish Kimchi"),
        
        //Ponytail Kimchi
        KimchiLocationData(address: "123 Kimchi Village, Jeolla Province, South Korea", name: "김치담는마을", translateName: "Kimchi Damneun Maeul", spiceLevel: 5, latitude: 35.842349, longitude: 127.129785, kimchiType: "Ponytail Radish Kimchi"),

        KimchiLocationData(address: "45 Isulchan Street, Jeolla Province, South Korea", name: "이슬찬김치", translateName: "Isulchan Kimchi", spiceLevel: 5, latitude: 35.948392, longitude: 126.985432, kimchiType: "Ponytail Radish Kimchi"),

        KimchiLocationData(address: "78 Gochu Road, Gochu District, South Korea", name: "고추총각", translateName: "Gochu Chonggak", spiceLevel: 5, latitude: 36.091273, longitude: 127.283746, kimchiType: "Ponytail Radish Kimchi"),

        KimchiLocationData(address: "98 Samgyori Makguksu Lane, Gangneung, South Korea", name: "삼교리 원조 동치미 막국수", translateName: "Samgyori Dongchimi Makguksu", spiceLevel: 4, latitude: 37.751853, longitude: 128.876490, kimchiType: "Ponytail Radish Kimchi"),

        KimchiLocationData(address: "58 Baekdo Makguksu Road, Goseong, South Korea", name: "백도막국수", translateName: "Baekdo Makguksu", spiceLevel: 4, latitude: 38.345792, longitude: 128.466481, kimchiType: "Ponytail Radish Kimchi"),
        
        // Water Kimchi
        
        KimchiLocationData(address: "1599 Nambusunhwan-ro, Sillim-dong, Gwanak-gu, Seoul, 08759 South Korea", name: "막불감동", translateName: "Makbul Gamdong", spiceLevel: 1, latitude: 37.4837, longitude: 126.9297, kimchiType: "Watery Radish Kimchi"),

        KimchiLocationData(address: "6-7 Banghwa-daero 49-gil, Gangseo-gu, Seoul, 157-848 South Korea", name: "고성막국수", translateName: "Goseong Makguksu", spiceLevel: 1, latitude: 37.5772, longitude: 126.8106, kimchiType: "Watery Radish Kimchi"),

        KimchiLocationData(address: "83 Nonhyeon-ro, Yangjae 2-dong, Seocho-gu, Seoul, 06775 South Korea", name: "성천동치미막국수", translateName: "Seongcheon Dongchimi Makguksu", spiceLevel: 1, latitude: 37.4697, longitude: 127.0372, kimchiType: "Watery Radish Kimchi"),

        KimchiLocationData(address: "22 Seocho-daero 78-gil, Seocho 2-dong, Seocho-gu, Seoul, 06621 South Korea", name: "청간막국수", translateName: "Cheonggan Makguksu", spiceLevel: 1, latitude: 37.5000, longitude: 127.0277, kimchiType: "Watery Radish Kimchi"),

        KimchiLocationData(address: "3 Tojeong-ro 37-gil, Yonggang-dong, Mapo-gu, Seoul, 04166 South Korea", name: "조박집", translateName: "Jobakjip", spiceLevel: 1, latitude: 37.5440, longitude: 126.9533, kimchiType: "Watery Radish Kimchi"),
        
        // Stuffed Kimchi
        
        KimchiLocationData(address: "244 Dangsan-ro, Dangsan 2-dong, Yeongdeungpo-gu, Seoul, South Korea", name: "이조보쌈", translateName: "Ijo Bossam", spiceLevel: 2, latitude: 37.5347, longitude: 126.9018, kimchiType: "Stuffed Kimchi"),

        KimchiLocationData(address: "8 Changdeokgung 1-gil, Gahoe-dong, Jongno-gu, Seoul, 03057 South Korea", name: "천하보쌈", translateName: "Cheonha Bossam", spiceLevel: 2, latitude: 37.5828, longitude: 126.9841, kimchiType: "Stuffed Kimchi"),

        KimchiLocationData(address: "14 Manlijae-ro 1-gil, Gongdeok-dong, Mapo-gu, Seoul, 04214 South Korea", name: "영광보쌈", translateName: "Yeonggwang Bossam", spiceLevel: 2, latitude: 37.5435, longitude: 126.9515, kimchiType: "Stuffed Kimchi"),

        KimchiLocationData(address: "297-6 Dokseodang-ro, Seongdong-gu, Seoul, 04730 South Korea", name: "은성보쌈", translateName: "Eunseong Bossam", spiceLevel: 2, latitude: 37.5433, longitude: 127.0235, kimchiType: "Stuffed Kimchi"),

        KimchiLocationData(address: "35 Sejong-daero, Mugyo-dong, Jung-gu, Seoul, 04519 South Korea", name: "왕가보쌈", translateName: "Wangga Bossam", spiceLevel: 2, latitude: 37.5673, longitude: 126.9784, kimchiType: "Stuffed Kimchi"),
        
        //열무
        KimchiLocationData(address: "Yeouido, Yeongdeungpo-gu, Seoul, South Korea", name: "고흥맛집", translateName: "Goheung Matjip", spiceLevel: 2, latitude: 37.5200, longitude: 126.9300, kimchiType: "Young Radish Kimchi"),

        KimchiLocationData(address: "Euljiro, Jung-gu, Seoul, South Korea", name: "광민분식", translateName: "Gwangmin Bunsik", spiceLevel: 2, latitude: 37.5670, longitude: 126.9970, kimchiType: "Young Radish Kimchi"),

        KimchiLocationData(address: "Gangdong-gu, Seoul, South Korea", name: "꽃집냉면", translateName: "Kkotjip Naengmyeon", spiceLevel: 2, latitude: 37.5500, longitude: 127.1460, kimchiType: "Young Radish Kimchi"),

        KimchiLocationData(address: "Gongneung-dong, Nowon-gu, Seoul, South Korea", name: "공릉우동집", translateName: "Gongneung Udongjip", spiceLevel: 2, latitude: 37.6200, longitude: 127.0800, kimchiType: "Young Radish Kimchi"),

        KimchiLocationData(address: "Myeongdong, Jung-gu, Seoul, South Korea", name: "명당만두", translateName: "Myeongdang Mandu", spiceLevel: 2, latitude: 37.5630, longitude: 126.9870, kimchiType: "Young Radish Kimchi"),
        
        //God Kimchi
        KimchiLocationData(address: "29 Yangjae-daero 85-gil, Gangdong-gu, Seoul, South Korea", name: "다람", translateName: "Daram", spiceLevel: 3, latitude: 37.5300, longitude: 127.1230, kimchiType: "Mustard Green Kimchi"),

        KimchiLocationData(address: "28 Bukchon-ro 1-gil, Jongno-gu, Seoul, South Korea", name: "온6.5", translateName: "On 6.5", spiceLevel: 2, latitude: 37.5820, longitude: 126.9830, kimchiType: "Mustard Green Kimchi"),

        KimchiLocationData(address: "21 Beobwon-ro 3-gil, Seocho-gu, Seoul, South Korea", name: "신숙", translateName: "Shinsook", spiceLevel: 2, latitude: 37.4910, longitude: 127.0070, kimchiType: "Mustard Green Kimchi"),

        KimchiLocationData(address: "19 Ichon-ro 77-gil, Yongsan-gu, Seoul, South Korea", name: "르미야", translateName: "Leumiya", spiceLevel: 2, latitude: 37.5220, longitude: 126.9730, kimchiType: "Mustard Green Kimchi"),

        KimchiLocationData(address: "61 World Cup-ro, Mapo-gu, Seoul, South Korea", name: "너랑나랑호프", translateName: "Neorang Narang Hof", spiceLevel: 2, latitude: 37.5560, longitude: 126.9100, kimchiType: "Mustard Green Kimchi"),

        // Cucumber
        KimchiLocationData(address: "155 Seosulla-gil, Jongno-gu, Seoul, South Korea", name: "개성", translateName: "Gaeseong", spiceLevel: 2, latitude: 37.5743, longitude: 126.9910, kimchiType: "Stuffed Cucumber Kimchi"),

        KimchiLocationData(address: "4-1 Hangang-daero 77-gil, Yongsan-gu, Seoul, South Korea", name: "원동미나리삼겹살", translateName: "Wondong Minari Samgyeopsal", spiceLevel: 2, latitude: 37.5445, longitude: 126.9718, kimchiType: "Stuffed Cucumber Kimchi"),

        KimchiLocationData(address: "19-1 Chungmu-ro, Jung-gu, Seoul, South Korea", name: "진고개", translateName: "Jingogae", spiceLevel: 2, latitude: 37.5610, longitude: 126.9930, kimchiType: "Stuffed Cucumber Kimchi"),

        KimchiLocationData(address: "34 Dobong-ro 110na-gil, Dobong-gu, Seoul, South Korea", name: "생생오리구이", translateName: "Saengsaeng Ori Gui", spiceLevel: 2, latitude: 37.6483, longitude: 127.0347, kimchiType: "Stuffed Cucumber Kimchi"),

        KimchiLocationData(address: "4-1 Hangang-daero 77-gil, Yongsan-gu, Seoul, South Korea", name: "원동미나리삼겹살", translateName: "Wondong Minari Samgyeopsal", spiceLevel: 2, latitude: 37.5445, longitude: 126.9718, kimchiType: "Stuffed Cucumber Kimchi"),
        
        //Jupgal
        
        KimchiLocationData(address: "65 Jong-ro, Jongno-gu, Seoul, South Korea", name: "하얀고래 종각본점", translateName: "Hayan Gorae Jonggak Main Branch", spiceLevel: 3, latitude: 37.5704, longitude: 126.9850, kimchiType: "Seafood Kimchi"),

        KimchiLocationData(address: "291 Banpo-daero, Seocho-gu, Seoul, South Korea", name: "김치얼스", translateName: "Kimcheers", spiceLevel: 2, latitude: 37.5030, longitude: 126.9820, kimchiType: "Seafood Kimchi"),

        KimchiLocationData(address: "62-1 Hangang-daero, Yongsan-gu, Seoul, South Korea", name: "대원식당", translateName: "Daewon Sikdang", spiceLevel: 2, latitude: 37.5335, longitude: 126.9610, kimchiType: "Seafood Kimchi"),

        KimchiLocationData(address: "111 Songpa-daero, Songpa-gu, Seoul, South Korea", name: "툇마루밥상", translateName: "Toetmaru Bapsang", spiceLevel: 2, latitude: 37.5140, longitude: 127.1050, kimchiType: "Seafood Kimchi"),

        KimchiLocationData(address: "148 Seolleung-ro, Gangnam-gu, Seoul, South Korea", name: "청담골", translateName: "Cheongdamgol", spiceLevel: 2, latitude: 37.5220, longitude: 127.0410, kimchiType: "Seafood Kimchi"),
        
        // Nabak Kimchi
        KimchiLocationData(address: "62-29 Changgyeonggung-ro, Jung-gu, Seoul, South Korea", name: "우래옥", translateName: "Woolaeok", spiceLevel: 1, latitude: 37.5704, longitude: 126.9921, kimchiType: "Nabak Kimchi"),

        KimchiLocationData(address: "32 Beobwon-ro 4-gil, Seocho-gu, Seoul, South Korea", name: "우진가 교대점", translateName: "Ujinga Gyo-dae Branch", spiceLevel: 1, latitude: 37.4924, longitude: 127.0137, kimchiType: "Nabak Kimchi"),

        KimchiLocationData(address: "28 Bukchon-ro 1-gil, Jongno-gu, Seoul, South Korea", name: "온6.5", translateName: "On 6.5", spiceLevel: 1, latitude: 37.5820, longitude: 126.9830, kimchiType: "Nabak Kimchi"),

        KimchiLocationData(address: "32-10 Insadong-gil, Jongno-gu, Seoul, South Korea", name: "뉘조", translateName: "Nwijo", spiceLevel: 1, latitude: 37.5740, longitude: 126.9850, kimchiType: "Nabak Kimchi"),

        KimchiLocationData(address: "65 Jong-ro, Jongno-gu, Seoul, South Korea", name: "하얀고래 종각본점", translateName: "Hayan Gorae Jonggak Main Branch", spiceLevel: 1, latitude: 37.5704, longitude: 126.9850, kimchiType: "Nabak Kimchi"),
        
        // G
        KimchiLocationData(address: "19 Eulji-ro 5-gil, Jung-gu, Seoul, South Korea", name: "달인겉절이칼국수", translateName: "Dalin Geotjeori Kalguksu", spiceLevel: 2, latitude: 37.5665, longitude: 126.9827, kimchiType: "Geotjeori Kimchi"),

        KimchiLocationData(address: "25 Baekjegobun-ro 45-gil, Songpa-gu, Seoul, South Korea", name: "메밀집", translateName: "Memiljip", spiceLevel: 2, latitude: 37.5117, longitude: 127.1123, kimchiType: "Geotjeori Kimchi"),

        KimchiLocationData(address: "62-29 Changgyeonggung-ro, Jung-gu, Seoul, South Korea", name: "현대칼국수", translateName: "Hyundai Kalguksu", spiceLevel: 2, latitude: 37.5704, longitude: 126.9921, kimchiType: "Geotjeori Kimchi"),

        KimchiLocationData(address: "12 Seoulsup 6-gil, Seongdong-gu, Seoul, South Korea", name: "최가네샤브버섯칼국수", translateName: "Choigane Shabu Mushroom Kalguksu", spiceLevel: 2, latitude: 37.5440, longitude: 127.0439, kimchiType: "Geotjeori Kimchi"),

        KimchiLocationData(address: "19-1 Chungmu-ro, Jung-gu, Seoul, South Korea", name: "진고개", translateName: "Jingogae", spiceLevel: 2, latitude: 37.5610, longitude: 126.9930, kimchiType: "Geotjeori Kimchi"),
        
        // Pa
        KimchiLocationData(address: "37 Gomdallae-ro 16-gil, Gangseo-gu, Seoul, South Korea", name: "풍천장어구이 파김치장어전골", translateName: "Pungcheon Grilled Eel with Green Onion Kimchi Hot Pot", spiceLevel: 2, latitude: 37.5410, longitude: 126.8395, kimchiType: "Green Onion Kimchi"),

        KimchiLocationData(address: "633 Siheung-daero, Yeongdeungpo-gu, Seoul, South Korea", name: "장어와파김치", translateName: "Jangeo wa Pakimchi", spiceLevel: 2, latitude: 37.4925, longitude: 126.9070, kimchiType: "Green Onion Kimchi"),

        KimchiLocationData(address: "18-20 Mabang-ro 10-gil, Seocho-gu, Seoul, South Korea", name: "감토감자탕 본점", translateName: "Gamto Gamjatang Main Branch", spiceLevel: 2, latitude: 37.4840, longitude: 127.0370, kimchiType: "Green Onion Kimchi"),

        KimchiLocationData(address: "61 Seokchonhosu-ro, Songpa-gu, Seoul, South Korea", name: "정이네찬 잠실본점", translateName: "Jeonginechan Jamsil Main Branch", spiceLevel: 2, latitude: 37.5080, longitude: 127.1000, kimchiType: "Green Onion Kimchi"),

        KimchiLocationData(address: "Unnamed Road, Gwanak-gu, Seoul, South Korea", name: "파김치장어전골", translateName: "Green Onion Kimchi Eel Hot Pot", spiceLevel: 2, latitude: 37.4780, longitude: 126.9510, kimchiType: "Green Onion Kimchi"),
        
        //Buchu
        KimchiLocationData(address: "40 Namdaemun-ro 9-gil, Jung-gu, Seoul, South Korea", name: "부추밭", translateName: "Buchu Bat", spiceLevel: 2, latitude: 37.5675, longitude: 126.9822, kimchiType: "Garlic Chives Kimchi"),

        KimchiLocationData(address: "291 Banpo-daero, Seocho-gu, Seoul, South Korea", name: "김치얼스", translateName: "Kimchi Earth's", spiceLevel: 2, latitude: 37.5030, longitude: 126.9820, kimchiType: "Garlic Chives Kimchi"),

        KimchiLocationData(address: "20 Bangbaecheon-ro 4-gil, Seocho-gu, Seoul, South Korea", name: "김부삼 사당역점", translateName: "Kimbu Sam Sadang Station Branch", spiceLevel: 2, latitude: 37.4835, longitude: 126.9820, kimchiType: "Garlic Chives Kimchi"),

        KimchiLocationData(address: "16-6 Nambusunhwan-ro 347-gil, Seocho-gu, Seoul, South Korea", name: "복돈이부추삼겹살", translateName: "Bokdoni Buchu Samgyeopsal", spiceLevel: 2, latitude: 37.4820, longitude: 126.9710, kimchiType: "Garlic Chives Kimchi"),

        KimchiLocationData(address: "6 Teheran-ro 1-gil, Gangnam-gu, Seoul, South Korea", name: "두레촌", translateName: "Durechon", spiceLevel: 2, latitude: 37.4970, longitude: 127.0280, kimchiType: "Garlic Chives Kimchi")
    ]
}
