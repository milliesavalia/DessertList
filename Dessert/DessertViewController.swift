import UIKit

class DessertViewController: UIViewController {
    var meals: [Meal] = [] {
        didSet {
            reloadDesserts()
        }
    }
    var desserts: [DessertViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let dessertService: DessertServiceProtocol = DessertService()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(DessertTableViewCell.self, forCellReuseIdentifier: "DessertTableViewCell")
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = NSLocalizedString("Dessert List", comment: "title")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = NSLocalizedString("Dessert List", comment: "title")
        view.addSubview(tableView)
        setupConstraints()
        fetch()
    }
    
    func reloadDesserts() {
        self.meals.forEach { meal in
            self.dessertService.requestDessertData(mealId: meal.idMeal) { result in
                switch result {
                case .success(let mealDetails):
                    if let mealDetails = mealDetails {
                        self.desserts.append(DessertViewModel(meal: mealDetails))
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetch() {
        self.dessertService.requestData() { result in
            switch result {
            case .success(let meals):
                guard let meals = meals else { return }
                self.meals = meals
            case .failure(let error):
                print(error)
            }
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension DessertViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dessertView = DessertDetailViewController()
        if let meal = meals.at(indexPath.row),
           let dessert = desserts.first(where: {$0.name == meal.strMeal}) {
            dessertView.setup(with: dessert)
        }
        navigationController?.pushViewController(dessertView, animated: true)
    }
}

extension DessertViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertTableViewCell", for: indexPath) as! DessertTableViewCell
        if let meal = meals.at(indexPath.row) {
            cell.setup(with: DessertViewModel(meal: meal))
        }
        return cell
    }
}

public extension Array {
    func at(_ index: Int) -> Element? {
        guard index < count && index >= 0 else { return nil }
        return self[index]
    }
}
