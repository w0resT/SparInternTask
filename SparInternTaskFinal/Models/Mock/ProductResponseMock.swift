import Foundation

struct ResponseMock {
    var response = ProductsResponse(products: [
        Product(id: "1", name: "Сыр Ламбер 500/0 230г", description: "Описание ", imageURL: "pic2", price: 99.99, oldPrice: 19000, discount: "25", badge: Badge(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3),
        Product(id: "2", name: "Сыр Ламбер 500/0 230г Cool", description: "Франция 2024", imageURL: "pic2", price: 9999.99, oldPrice: nil, discount: nil, badge: nil, rating: 5.0),
        Product(id: "3", name: "Сыр Ламбер 500/0 230г Test Big name", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: Badge(text: "Новинка", textColor: "#FFFFFF", backgroundColor: "#8786C1"), rating: 4.3),
        Product(id: "4", name: "Сыр Ламбер 500/0 230г", description: nil, imageURL: "pic2", price: 9999.99, oldPrice: nil, discount: nil, badge: nil, rating: 5.0),
        Product(id: "5", name: "Сыр Ламбер 500/0 230г", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: Badge(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#6BD288"), rating: 4.3),
        Product(id: "6", name: "Сыр Ламбер 500/0 230г", description: nil, imageURL: "pic2", price: 9999.99, oldPrice: nil, discount: nil, badge: nil, rating: 5.0)
    ])
}
