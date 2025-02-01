//
//  KimchiRelatedFoodsData.swift
//  Kimchi
//
//  Created by Oliver Park on 12/31/24.
//

import Foundation
import SwiftData


@Model
class KimchiRelatedFoodsData: Identifiable, ObservableObject {
    var id = UUID()
    var foodName: String
    var koreanFoodName: String
    var kimchiName: String
    var tag: Int
    
    
    init(foodName: String, koreanFoodName: String, kimchiName: String, tag: Int) {
        self.foodName = foodName
        self.koreanFoodName = koreanFoodName
        self.kimchiName = kimchiName
        self.tag = tag
    }
    
}

struct KimchiRelatedFoodsList {
    static let kimchiRelatedFoods: [KimchiRelatedFoodsData] = [
        // Cabbage Kimchi
        KimchiRelatedFoodsData(foodName: "Grilled Pork Belly (Samgyeopsal)", koreanFoodName: "삼겹살", kimchiName: "Cabbage Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Kimchi Stew (Kimchi Jjigae)", koreanFoodName: "김치찌개", kimchiName: "Cabbage Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Kimchi Fried Rice", koreanFoodName: "김치 볶음밥", kimchiName: "Cabbage Kimchi", tag: 3),
        
        // White Kimchi
        KimchiRelatedFoodsData(foodName: "Naengmyeon", koreanFoodName: "냉면", kimchiName: "White Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Boiled Pork Wraps (Bossam)", koreanFoodName: "보쌈", kimchiName: "White Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Soybean Paste Soup (Doenjang Jjigae)", koreanFoodName: "된장찌개", kimchiName: "White Kimchi", tag: 3),
        
        // Cubed Radish Kimchi
        KimchiRelatedFoodsData(foodName: "Ox Bone Soup (Seolleongtang)", koreanFoodName: "설렁탕", kimchiName: "Cubed Radish Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Korean Fried Chicken", koreanFoodName: "치킨", kimchiName: "Cubed Radish Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Steamed Sweet Potatoes", koreanFoodName: "고구마", kimchiName: "Cubed Radish Kimchi", tag: 3),
        
        // Ponytail Radish Kimchi
        KimchiRelatedFoodsData(foodName: "Barley Rice", koreanFoodName: "보리밥", kimchiName: "Ponytail Radish Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Soy Sauce Braised Beef (Jangjorim)", koreanFoodName: "장조림", kimchiName: "Ponytail Radish Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Spicy Braised Chicken (Dakbokkeumtang)", koreanFoodName: "닭볶음탕", kimchiName: "Ponytail Radish Kimchi", tag: 3),
        
        // Watery Radish Kimchi
        KimchiRelatedFoodsData(foodName: "Buckwheat Noodles (Makguksu)", koreanFoodName: "막국수", kimchiName: "Watery Radish Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Korean Dumplings (Mandu)", koreanFoodName: "만두", kimchiName: "Watery Radish Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Boiled Pork Slices (Suyuk)", koreanFoodName: "수육", kimchiName: "Watery Radish Kimchi", tag: 3),
        
        // Stuffed Kimchi
        KimchiRelatedFoodsData(foodName: "Boiled Pork Wraps (Bossam)", koreanFoodName: "보쌈", kimchiName: "Stuffed Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Seafood Pancake (Haemul Pajeon)", koreanFoodName: "해물파전", kimchiName: "Stuffed Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Soybean Paste Soup (Doenjang Jjigae)", koreanFoodName: "된장찌개", kimchiName: "Stuffed Kimchi", tag: 3),
        
        // Young Radish Kimchi
        KimchiRelatedFoodsData(foodName: "Cold Noodles with Young Radish (Yeolmu Bibim Guksu)", koreanFoodName: "열무비빔국수", kimchiName: "Young Radish Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Grilled Mackerel (Godeungeo Gui)", koreanFoodName: "고등어구이", kimchiName: "Young Radish Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Korean Rice Rolls (Kimbap)", koreanFoodName: "김밥", kimchiName: "Young Radish Kimchi", tag: 3),
        
        // Mustard Green Kimchi
        KimchiRelatedFoodsData(foodName: "Rice Porridge (Juk)", koreanFoodName: "죽", kimchiName: "Mustard Green Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Spicy Stir-Fried Pork (Jeyuk Bokkeum)", koreanFoodName: "제육볶음", kimchiName: "Mustard Green Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Grilled Eel (Jang-eo Gui)", koreanFoodName: "장어구이", kimchiName: "Mustard Green Kimchi", tag: 3),
        
        // Stuffed Cucumber Kimchi
        KimchiRelatedFoodsData(foodName: "Cold Noodle Soup (Mul Naengmyeon)", koreanFoodName: "물냉면", kimchiName: "Stuffed Cucumber Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Grilled Chicken (Dak Galbi)", koreanFoodName: "닭갈비", kimchiName: "Stuffed Cucumber Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Pan-Fried Tofu (Dubujeon)", koreanFoodName: "두부전", kimchiName: "Stuffed Cucumber Kimchi", tag: 3),
        
        // Seafood Kimchi
        KimchiRelatedFoodsData(foodName: "Steamed Rice with Clam Soup (Bongole Tang)", koreanFoodName: "봉골레탕", kimchiName: "Seafood Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Korean Seafood Hot Pot (Haemultang)", koreanFoodName: "해물탕", kimchiName: "Seafood Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Spicy Stir-Fried Squid (Ojingeo Bokkeum)", koreanFoodName: "오징어볶음", kimchiName: "Seafood Kimchi", tag: 3),
        
        // Nabak Kimchi
        KimchiRelatedFoodsData(foodName: "Korean BBQ (Gogi Gui)", koreanFoodName: "고기구이", kimchiName: "Nabak Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Plain Noodles (Guksu)", koreanFoodName: "국수", kimchiName: "Nabak Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Steamed Egg (Gyeran Jjim)", koreanFoodName: "계란찜", kimchiName: "Nabak Kimchi", tag: 3),
        
        // Geotjeori Kimchi
        KimchiRelatedFoodsData(foodName: "Grilled Short Ribs (Galbi)", koreanFoodName: "갈비", kimchiName: "Geotjeori Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Stir-Fried Glass Noodles (Japchae)", koreanFoodName: "잡채", kimchiName: "Geotjeori Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Tofu Stew (Sundubu Jjigae)", koreanFoodName: "순두부찌개", kimchiName: "Geotjeori Kimchi", tag: 3),

        // Green Onion Kimchi
        KimchiRelatedFoodsData(foodName: "Grilled Mackerel (Godeungeo Gui)", koreanFoodName: "고등어구이", kimchiName: "Green Onion Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Rice Cake Soup (Tteokguk)", koreanFoodName: "떡국", kimchiName: "Green Onion Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Spicy Pork Ribs (Dwaeji Galbi Jjim)", koreanFoodName: "돼지갈비찜", kimchiName: "Green Onion Kimchi", tag: 3),

        // Garlic Chives Kimchi
        KimchiRelatedFoodsData(foodName: "Korean BBQ (Gogi Gui)", koreanFoodName: "고기구이", kimchiName: "Garlic Chives Kimchi", tag: 1),
        KimchiRelatedFoodsData(foodName: "Bibimbap", koreanFoodName: "비빔밥", kimchiName: "Garlic Chives Kimchi", tag: 2),
        KimchiRelatedFoodsData(foodName: "Seafood Pancake (Haemul Pajeon)", koreanFoodName: "해물파전", kimchiName: "Garlic Chives Kimchi", tag: 3)
    ]
}
