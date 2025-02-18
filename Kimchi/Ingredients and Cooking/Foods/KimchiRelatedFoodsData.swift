import Foundation
import SwiftData


struct KimchiRelatedFoodsData: Identifiable {
    var id = UUID()
    var foodName: String
    var koreanFoodName: String
    var kimchiName: String
    var tag: Int
    var description: String

}

struct KimchiRelatedFoodsList {
    static let kimchiRelatedFoods: [KimchiRelatedFoodsData] = [
        // Cabbage Kimchi
        KimchiRelatedFoodsData(foodName: "Grilled Pork Belly (Samgyeopsal)", koreanFoodName: "삼겹살", kimchiName: "Cabbage Kimchi", tag: 1, description: "The rich, fatty taste of grilled pork belly is perfectly balanced by the tangy and spicy notes of cabbage kimchi."),
        KimchiRelatedFoodsData(foodName: "Kimchi Stew (Kimchi Jjigae)", koreanFoodName: "김치찌개", kimchiName: "Cabbage Kimchi", tag: 2, description: "A comforting stew made with aged cabbage kimchi, bringing out deep umami flavors when cooked with pork and tofu."),
        KimchiRelatedFoodsData(foodName: "Kimchi Fried Rice", koreanFoodName: "김치 볶음밥", kimchiName: "Cabbage Kimchi", tag: 3, description: "A simple yet flavorful dish where cabbage kimchi adds a spicy and tangy punch to stir-fried rice."),
        
        // White Kimchi
        KimchiRelatedFoodsData(foodName: "Naengmyeon", koreanFoodName: "냉면", kimchiName: "White Kimchi", tag: 1, description: "The mild and refreshing taste of white kimchi complements the cool, tangy broth of naengmyeon."),
        KimchiRelatedFoodsData(foodName: "Boiled Pork Wraps (Bossam)", koreanFoodName: "보쌈", kimchiName: "White Kimchi", tag: 2, description: "White kimchi provides a crunchy, slightly sweet contrast to the tender, rich slices of boiled pork."),
        KimchiRelatedFoodsData(foodName: "Soybean Paste Soup (Doenjang Jjigae)", koreanFoodName: "된장찌개", kimchiName: "White Kimchi", tag: 3, description: "The mild, fermented taste of white kimchi balances the deep, earthy flavors of doenjang jjigae."),
        
        // Cubed Radish Kimchi
        KimchiRelatedFoodsData(foodName: "Ox Bone Soup (Seolleongtang)", koreanFoodName: "설렁탕", kimchiName: "Cubed Radish Kimchi", tag: 1, description: "The crisp, spicy crunch of cubed radish kimchi enhances the creamy, mild broth of seolleongtang."),
        KimchiRelatedFoodsData(foodName: "Korean Fried Chicken", koreanFoodName: "치킨", kimchiName: "Cubed Radish Kimchi", tag: 2, description: "The acidity and crunch of cubed radish kimchi act as a perfect palate cleanser for crispy fried chicken."),
        KimchiRelatedFoodsData(foodName: "Steamed Sweet Potatoes", koreanFoodName: "고구마", kimchiName: "Cubed Radish Kimchi", tag: 3, description: "The slightly sour and crisp texture of radish kimchi contrasts beautifully with the natural sweetness of steamed sweet potatoes."),

        KimchiRelatedFoodsData(foodName: "Buckwheat Noodles (Makguksu)", koreanFoodName: "막국수", kimchiName: "Watery Radish Kimchi", tag: 1, description: "The light and refreshing taste of watery radish kimchi enhances the nutty, cold buckwheat noodles."),
        KimchiRelatedFoodsData(foodName: "Korean Dumplings (Mandu)", koreanFoodName: "만두", kimchiName: "Watery Radish Kimchi", tag: 2, description: "Watery radish kimchi’s crunch and subtle spice add a refreshing balance to the soft texture of dumplings."),
        KimchiRelatedFoodsData(foodName: "Boiled Pork Slices (Suyuk)", koreanFoodName: "수육", kimchiName: "Watery Radish Kimchi", tag: 3, description: "The mildly spicy, tangy broth of watery radish kimchi cuts through the rich taste of boiled pork slices."),
        
        KimchiRelatedFoodsData(foodName: "Grilled Mackerel (Godeungeo Gui)", koreanFoodName: "고등어구이", kimchiName: "Young Radish Kimchi", tag: 2, description: "Young radish kimchi’s crisp, peppery taste pairs well with the smoky, oily flavor of grilled mackerel."),
        KimchiRelatedFoodsData(foodName: "Korean Rice Rolls (Kimbap)", koreanFoodName: "김밥", kimchiName: "Young Radish Kimchi", tag: 3, description: "The fresh, crunchy texture of young radish kimchi enhances the soft, savory taste of kimbap."),
        
        KimchiRelatedFoodsData(foodName: "Grilled Short Ribs (Galbi)", koreanFoodName: "갈비", kimchiName: "Geotjeori Kimchi", tag: 1, description: "The lightly fermented, fresh taste of geotjeori kimchi pairs well with the smoky, sweet marinade of grilled short ribs."),
        KimchiRelatedFoodsData(foodName: "Stir-Fried Glass Noodles (Japchae)", koreanFoodName: "잡채", kimchiName: "Geotjeori Kimchi", tag: 2, description: "The crisp and fresh flavors of geotjeori kimchi cut through the sweetness of stir-fried glass noodles."),
        KimchiRelatedFoodsData(foodName: "Tofu Stew (Sundubu Jjigae)", koreanFoodName: "순두부찌개", kimchiName: "Geotjeori Kimchi", tag: 3, description: "Geotjeori kimchi’s fresh crunch provides a vibrant contrast to the soft, spicy broth of sundubu jjigae.")
    ]
}
