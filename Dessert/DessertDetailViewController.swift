import UIKit
import SDWebImage

class DessertDetailViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "nophoto")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .darkText
        return label
    }()
    
    private lazy var areaLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Ingredients:"
        return label
    }()
    
    private lazy var ingredientsStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        commonSetup()
    }
    
    public func setup(with dessert: DessertViewModel) {
        nameLabel.text = dessert.name
        if let area = dessert.area {
            areaLabel.text = "Origin: \(area)"
        }
        if let instruction = dessert.instructions {
            instructionsLabel.text = "Directions: \(instruction)"
        }
        
        if let imageURL = URL(string: dessert.image) {
            photoImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "nophoto"))
        }
        
        ingredientsStackView.addArrangedSubview(ingredientsLabel)
        if !dessert.formattedIngredients.isEmpty {
            dessert.formattedIngredients.forEach { ingredient in
                let label = UILabel(frame: .zero)
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 14)
                label.backgroundColor = .clear
                label.textAlignment = .left
                label.numberOfLines = 0
                label.textColor = .black
                label.text = ingredient
                self.ingredientsStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func commonSetup() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackView)
        scrollStackView.addSubview(photoImageView)
        scrollStackView.addSubview(nameLabel)
        scrollStackView.addSubview(areaLabel)
        scrollStackView.addSubview(ingredientsStackView)
        scrollStackView.addSubview(instructionsLabel)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    
            scrollStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            photoImageView.centerXAnchor.constraint(equalTo: scrollStackView.centerXAnchor),
            photoImageView.topAnchor.constraint(equalTo: scrollStackView.topAnchor, constant: 10),
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            photoImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 350),
            
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: scrollStackView.leadingAnchor, constant: 20),
            
            areaLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            areaLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            ingredientsStackView.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 16),
            ingredientsStackView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ingredientsStackView.trailingAnchor.constraint(equalTo: scrollStackView.trailingAnchor, constant: -20),
            
            instructionsLabel.topAnchor.constraint(equalTo: ingredientsStackView.bottomAnchor, constant: 16),
            instructionsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            instructionsLabel.trailingAnchor.constraint(equalTo: ingredientsStackView.trailingAnchor),
            instructionsLabel.bottomAnchor.constraint(equalTo: scrollStackView.bottomAnchor, constant: -20)
        ])
    }
}
