import UIKit

class CardModel {

    var name: String
    var description: String
    var imageName: String
    var galleryImages: [String] = []

    init(name: String, description: String, imageName: String, galleryImages: [String]) {
        self.name = name
        self.description = description
        self.imageName = imageName
        self.galleryImages = galleryImages
    }
}
