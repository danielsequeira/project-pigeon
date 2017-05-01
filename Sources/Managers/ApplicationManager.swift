import Foundation

public class ApplicationManager {
    static let shared = ApplicationManager()

    var currentUser: String?
    var currentCity: String?
    var cardList: [CardModel]? = []
    var currentCard: String?

    private init() {}
}
