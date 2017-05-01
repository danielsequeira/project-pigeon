import Foundation

class LoginViewModel {
    init() {}

    func validateLoginFields(username: String, password: String) -> Bool {
        return true
    }

    func login(username: String, password: String) -> Bool {
        // Integrate with Firebase

        // Login is valid
        ApplicationManager.shared.currentUser = username
        
        let card1 = CardModel.init(name: "Pendergast 🍗", description: "You're not in Kansas anymore.\nAn American smokehouse with the best ribs in town.", imageName: "pendergast", galleryImages: ["pendergast", "pendergast1", "pendergast2"])
        let card2 = CardModel.init(name: "Noorderlicht 🍷", description: "A glasshouse, a firepit, a waterfront view, live music. What more do you want?", imageName: "noorderlicht", galleryImages: ["pendergast", "pendergast1", "pendergast2"])
        
        let card3 = CardModel.init(name: "Meneer De Wit Heeft Honger 🍴", description: "Real Mediterranean in real Amsterdam.\nA dining experience not to be missed.", imageName: "meneer-de-wit-heeft-honger", galleryImages: ["pendergast", "pendergast1", "pendergast2"])
        
        ApplicationManager.shared.cardList?.append(card1)
        ApplicationManager.shared.cardList?.append(card2)
        ApplicationManager.shared.cardList?.append(card3)

        return true
    }
}
