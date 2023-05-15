import Foundation
import UIKit

class DessertViewModel {
    let name: String
    let image: String
    let area: String?
    let instructions: String?
    var formattedIngredients: [String] = []
    
    init(meal: Meal) {
        self.name = meal.strMeal
        self.image = meal.strMealThumb
        self.area = meal.strArea
        self.instructions = meal.strInstructions
        if let m1 = meal.strMeasure1,
           let i1 = meal.strIngredient1 {
            self.formattedIngredients.append("\(m1) \(i1)")
        }
        if let m2 = meal.strMeasure2,
           let i2 = meal.strIngredient2 {
            self.formattedIngredients.append("\(m2) \(i2)")
        }
        if let m3 = meal.strMeasure3,
           let i3 = meal.strIngredient3 {
            self.formattedIngredients.append("\(m3) \(i3)")
        }
        if let m4 = meal.strMeasure4,
           let i4 = meal.strIngredient4 {
            self.formattedIngredients.append("\(m4) \(i4)")
        }
        if let m5 = meal.strMeasure5,
           let i5 = meal.strIngredient5 {
            self.formattedIngredients.append("\(m5) \(i5)")
        }
        if let m6 = meal.strMeasure6,
           let i6 = meal.strIngredient6 {
            self.formattedIngredients.append("\(m6) \(i6)")
        }
        if let m7 = meal.strMeasure7,
           let i7 = meal.strIngredient7 {
            self.formattedIngredients.append("\(m7) \(i7)")
        }
        if let m8 = meal.strMeasure8,
           let i8 = meal.strIngredient8,
           !i8.isEmpty {
            self.formattedIngredients.append("\(m8) \(i8)")
        }
        if let m9 = meal.strMeasure9,
           let i9 = meal.strIngredient9,
           !i9.isEmpty {
            self.formattedIngredients.append("\(m9) \(i9)")
        }
        if let m10 = meal.strMeasure10,
           let i10 = meal.strIngredient10,
           !i10.isEmpty {
            self.formattedIngredients.append("\(m10) \(i10)")
        }
        if let m11 = meal.strMeasure11,
           let i11 = meal.strIngredient11,
           !i11.isEmpty {
            self.formattedIngredients.append("\(m11) \(i11)")
        }
        if let m12 = meal.strMeasure12,
           let i12 = meal.strIngredient12,
           !i12.isEmpty {
            self.formattedIngredients.append("\(m12) \(i12)")
        }
        if let m13 = meal.strMeasure13,
           let i13 = meal.strIngredient13,
           !i13.isEmpty {
            self.formattedIngredients.append("\(m13) \(i13)")
        }
        if let m14 = meal.strMeasure14,
            let i14 = meal.strIngredient14,
           !i14.isEmpty {
            self.formattedIngredients.append("\(m14) \(i14)")
         }
        if let m15 = meal.strMeasure15,
           let i15 = meal.strIngredient15,
           !i15.isEmpty {
            self.formattedIngredients.append("\(m15) \(i15)")
        }
        if let m16 = meal.strMeasure16,
           let i16 = meal.strIngredient16,
           !i16.isEmpty {
            self.formattedIngredients.append("\(m16) \(i16)")
        }
        if let m17 = meal.strMeasure17,
           let i17 = meal.strIngredient17,
           !i17.isEmpty {
            self.formattedIngredients.append("\(m17) \(i17)")
        }
        if let m18 = meal.strMeasure18,
           let i18 = meal.strIngredient18,
           !i18.isEmpty {
            self.formattedIngredients.append("\(m18) \(i18)")
        }
        if let m19 = meal.strMeasure19,
           let i19 = meal.strIngredient19,
           !i19.isEmpty {
            self.formattedIngredients.append("\(m19) \(i19)")
        }
        if let m20 = meal.strMeasure20,
           let i20 = meal.strIngredient20,
           !i20.isEmpty {
            self.formattedIngredients.append("\(m20) \(i20)")
        }
    }
}
