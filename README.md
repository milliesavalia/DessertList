# DessertList
Fetches a list of dessert recipes from API

To run: Open xcodeproj file and run on any iPhone device.

Networking:
- Created DessertServiceProtocol for two network requests so that I can create a service that conforms to that protocol. Later when I want to write tests, I can create a mock networking service that comforms to the same protocol.
- Both network requests use URLSession to load data and then decode from JSON to the Meal model and return success or return failures for errors.

Model:
- Uses Codable for JSON serialization.

ViewModel:
- Takes in a Meal at init
- Sets the equivalent values and computes ingredients and measures into an array of formatted ingredients.

DessertViewController:
- On viewDidLoad() it sets up the tableView constraints and calls fetch.
- The fetch calls the initial request for a list of the dessert category meals with limited information about the meals.
- Once the list is loaded and the meal array is set, it calls reloadDesserts() to fetch each of the dessert's full details and append a DessertViewModel for each dessert to the desserts array
- The table view reloads when the dessert array gets updated.
- The tableView cells are set up with dequable cells so they can be reused as the user scrolls providing for a smooth scroll.
- When a cell is selected, the navigationController pushes to a DessertDetailViewController.

TableViewCell:
- Made to be as dumb as possible, doesn't hold any information.
- Gets setup with a DessertViewModel and gets torn down for easy reuse.
- Image is loaded with SDWebImage, an asynchronous image loader with caching support.

DessertDetailViewController:
- Made to be as dumb as possible and gets setup with a fully loaded DessertViewModel.
- Image is loaded with SDWebImage, an asynchronous image loader with caching support.
- Scrolling capability for longer recipes
- Ingredients layed out in a stack view

Testing:
- If I had more time to work on the project and in a professional setting where could would be shipped I would definitely add tests.
- I would create a MockNetworkService and mock requests for each of the calls.
- I would add tests for:
  1. DessertServiceSpec to test the network calls
  2. DessertViewModelSpec to test the formatting of ingredients and that null values are filtered out correctly
  3. DessertViewControllerSpec to test the fetch gets called and behaves accordingly
  4. DessertDetailViewControllerSpec for testing correct setup of detail view with loaded meal details
