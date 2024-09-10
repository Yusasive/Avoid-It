import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart'; // Import the barcode scanner

class HomePageContent extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  final List<Map<String, String>> products = [
    
    {"product": "Coca-Cola", "status": "Boycotted", "alternative": "Pepsi"},
    {"product": "Nestlé", "status": "Boycotted", "alternative": "Almarai"},
    {"product": "Starbucks", "status": "Boycotted", "alternative": "Costa"},
    {
      "product": "McDonald's",
      "status": "Boycotted",
      "alternative": "Burger King"
    },
    {
      "product": "Unilever",
      "status": "Boycotted",
      "alternative": "Local Brands"
    },
    {"product": "Nike", "status": "Boycotted", "alternative": "Adidas"},
    {"product": "L'Oréal", "status": "Boycotted", "alternative": "Garnier"},
    {"product": "Danone", "status": "Boycotted", "alternative": "Al Safi"},
    {"product": "Intel", "status": "Boycotted", "alternative": "AMD"},
    {"product": "HP", "status": "Boycotted", "alternative": "Dell"},
    {"product": "Puma", "status": "Boycotted", "alternative": "Reebok"},
    {"product": "KFC", "status": "Boycotted", "alternative": "Texas Chicken"},
    {"product": "Pizza Hut", "status": "Boycotted", "alternative": "Domino's"},
    {
      "product": "Disney",
      "status": "Boycotted",
      "alternative": "Studio Ghibli"
    },
    {
      "product": "Victoria's Secret",
      "status": "Boycotted",
      "alternative": "Soma"
    },
    {
      "product": "Johnson & Johnson",
      "status": "Boycotted",
      "alternative": "Aveeno"
    },
    {
      "product": "Estee Lauder",
      "status": "Boycotted",
      "alternative": "The Body Shop"
    },
    {"product": "Timberland", "status": "Boycotted", "alternative": "Red Wing"},
    {"product": "Intel", "status": "Boycotted", "alternative": "ARM"},
    {"product": "Ahava", "status": "Boycotted", "alternative": "Lush"},
    {"product": "Ariel", "status": "Boycotted", "alternative": "Persil"},
    {
      "product": "McVitie's",
      "status": "Boycotted",
      "alternative": "Digestive (Al Islami)"
    },
    {"product": "HP", "status": "Boycotted", "alternative": "Asus"},
    {"product": "Puma", "status": "Boycotted", "alternative": "New Balance"},
    {"product": "Calvin Klein", "status": "Boycotted", "alternative": "Levi's"},
    {"product": "Volkswagen", "status": "Boycotted", "alternative": "Toyota"},
    {"product": "IBM", "status": "Boycotted", "alternative": "Dell"},
    {"product": "Ahava", "status": "Boycotted", "alternative": "Nivea"},
    {"product": "SodaStream", "status": "Boycotted", "alternative": "Aarke"},
    {"product": "Kleenex", "status": "Boycotted", "alternative": "Scott"},
    {
      "product": "Ben & Jerry's",
      "status": "Boycotted",
      "alternative": "Haagen-Dazs"
    },
    {
      "product": "Tiffany & Co",
      "status": "Boycotted",
      "alternative": "Swarovski"
    },
    {"product": "Sony", "status": "Boycotted", "alternative": "Samsung"},
    {"product": "Delta Galil", "status": "Boycotted", "alternative": "Hanro"},
    {
      "product": "Sabra Hummus",
      "status": "Boycotted",
      "alternative": "Cedar's Hummus"
    },
    {"product": "GAP", "status": "Boycotted", "alternative": "Uniqlo"},
    {"product": "Converse", "status": "Boycotted", "alternative": "Vans"},
    {"product": "Intel", "status": "Boycotted", "alternative": "Qualcomm"},
    {
      "product": "General Electric",
      "status": "Boycotted",
      "alternative": "Panasonic"
    },
    {"product": "Caterpillar", "status": "Boycotted", "alternative": "Komatsu"},
    {"product": "Dannon", "status": "Boycotted", "alternative": "Al Safi"},
    {"product": "Amazon", "status": "Boycotted", "alternative": "Shopify"},
    {"product": "Canon", "status": "Boycotted", "alternative": "Nikon"},
    {"product": "Dell", "status": "Boycotted", "alternative": "Acer"},
    {
      "product": "Victoria's Secret",
      "status": "Boycotted",
      "alternative": "Aerie"
    },
    {"product": "Boeing", "status": "Boycotted", "alternative": "Airbus"},
    {
      "product": "Tiffany & Co",
      "status": "Boycotted",
      "alternative": "Cartier"
    },
    {"product": "Walmart", "status": "Boycotted", "alternative": "Target"},
    {"product": "PepsiCo", "status": "Boycotted", "alternative": "Coca-Cola"},
    {"product": "Chevron", "status": "Boycotted", "alternative": "Shell"},
    {"product": "Mizuno", "status": "Boycotted", "alternative": "Adidas"},
    {
      "product": "Bacardi",
      "status": "Boycotted",
      "alternative": "Local Non-Alcoholic Drinks"
    },
    {
      "product": "Harley Davidson",
      "status": "Boycotted",
      "alternative": "Yamaha"
    },
    {"product": "Revlon", "status": "Boycotted", "alternative": "NYX"},
    {"product": "Caterpillar", "status": "Boycotted", "alternative": "Kubota"},
    {"product": "Disney", "status": "Boycotted", "alternative": "DreamWorks"},
    {"product": "IBM", "status": "Boycotted", "alternative": "HP"},
    {"product": "Ahava", "status": "Boycotted", "alternative": "Kiehl's"},
    {"product": "L'Oréal", "status": "Boycotted", "alternative": "Schwarzkopf"},
    {
      "product": "McDonald's",
      "status": "Boycotted",
      "alternative": "Chick-fil-A"
    },
    {"product": "Lacoste", "status": "Boycotted", "alternative": "Fred Perry"},
    {
      "product": "Marks & Spencer",
      "status": "Boycotted",
      "alternative": "Next"
    },
    {
      "product": "Dunkin' Donuts",
      "status": "Boycotted",
      "alternative": "Krispy Kreme"
    },
    {"product": "Nestlé", "status": "Boycotted", "alternative": "Nadec"},
    {
      "product": "Perrier",
      "status": "Boycotted",
      "alternative": "San Pellegrino"
    },
    {"product": "TOMS", "status": "Boycotted", "alternative": "Skechers"},
    {"product": "Timberland", "status": "Boycotted", "alternative": "Clarks"},
    {"product": "Apple", "status": "Boycotted", "alternative": "Samsung"},
    {"product": "Microsoft", "status": "Boycotted", "alternative": "Google"},
    {"product": "Fox News", "status": "Boycotted", "alternative": "BBC"},
    {"product": "Zara", "status": "Boycotted", "alternative": "H&M"},
    {"product": "Walmart", "status": "Boycotted", "alternative": "Costco"},
    {"product": "P&G", "status": "Boycotted", "alternative": "Unilever"},
    {"product": "Gatorade", "status": "Boycotted", "alternative": "Powerade"},
    {"product": "Sprite", "status": "Boycotted", "alternative": "7Up"},
    {
      "product": "Budweiser",
      "status": "Boycotted",
      "alternative": "Non-Alcoholic Alternatives"
    },
    {
      "product": "Heineken",
      "status": "Boycotted",
      "alternative": "Non-Alcoholic Beverages"
    },
    {"product": "Levi's", "status": "Boycotted", "alternative": "Wrangler"},
    {"product": "Puma", "status": "Boycotted", "alternative": "ASICS"},
    {"product": "Adidas", "status": "Boycotted", "alternative": "Under Armour"},
    {
      "product": "Tommy Hilfiger",
      "status": "Boycotted",
      "alternative": "Ralph Lauren"
    },
    {
      "product": "American Eagle",
      "status": "Boycotted",
      "alternative": "Uniqlo"
    },
    {"product": "HP", "status": "Boycotted", "alternative": "Lenovo"},
    {"product": "Canon", "status": "Boycotted", "alternative": "Fujifilm"},
    {"product": "Colgate", "status": "Boycotted", "alternative": "Sensodyne"},
    {"product": "Samsung", "status": "Boycotted", "alternative": "Sony"},
    {"product": "Amazon", "status": "Boycotted", "alternative": "Alibaba"},
    {"product": "Microsoft", "status": "Boycotted", "alternative": "Linux"},
    {"product": "Caterpillar", "status": "Boycotted", "alternative": "Hitachi"},
    {"product": "Nestlé", "status": "Boycotted", "alternative": "Oasis"},
    {
      "product": "McDonald's",
      "status": "Boycotted",
      "alternative": "Five Guys"
    },
    {
      "product": "Baskin Robbins",
      "status": "Boycotted",
      "alternative": "Cold Stone Creamery"
    },
    {"product": "Disney", "status": "Boycotted", "alternative": "Nickelodeon"},
    {"product": "Intel", "status": "Boycotted", "alternative": "AMD"},
    {"product": "Nike", "status": "Boycotted", "alternative": "Under Armour"},
    {"product": "Ford", "status": "Boycotted", "alternative": "Honda"},
    {"product": "BMW", "status": "Boycotted", "alternative": "Lexus"},
    {"product": "Gap", "status": "Boycotted", "alternative": "H&M"},
    {"product": "Puma", "status": "Boycotted", "alternative": "Reebok"},
    {"product": "Amazon", "status": "Boycotted", "alternative": "eBay"},
    {"product": "Google", "status": "Boycotted", "alternative": "DuckDuckGo"},
    {"product": "Sony", "status": "Boycotted", "alternative": "LG"}
  ];

  List<Map<String, String>> searchResults = [];
  String searchQuery = "";

  // Debounce timer for better search performance
  Timer? _debounce;

  // Function to search products dynamically but not show modal until clicked
  void searchProductSuggestions(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    List<Map<String, String>> results = products.where((product) {
      final productName = product['product']!.toLowerCase();
      return productName.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = results;
    });
  }

  // Function to search product after user submits
  void searchProduct(String query) {
    List<Map<String, String>> results = products.where((product) {
      final productName = product['product']!.toLowerCase();
      return productName.contains(query.toLowerCase());
    }).toList();

    if (results.isNotEmpty) {
      _showProductModal(results.first);
    } else {
      _showNotFoundModal();
    }
  }

  // Function to show product details in a modal
  void _showProductModal(Map<String, String> product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            product['product']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This brand supports the Israeli occupation',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'هذه الشركة تدعم الاحتلال الإسرائيلي',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Alternative Product: ${product['alternative']}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show "Not Found" modal
  void _showNotFoundModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Product Not Found',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'The scanned product is not in our boycott list.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Try searching for other products.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Debounced search (Delays search while typing)
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      searchProductSuggestions(query); // Trigger suggestions after delay
    });
  }

  // Implementing barcode scanning
  Future<void> scanBarcode() async {
    var result = await BarcodeScanner.scan();
    if (result.rawContent.isNotEmpty) {
      searchProduct(result.rawContent); // Using barcode content to search
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boycott Checker'),
        backgroundColor: Color.fromARGB(255, 213, 111, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Scan or Search for Products to Check Boycott Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan Product Barcode'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Product',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _onSearchChanged(value); // Show suggestions while typing
                searchQuery = value; // Update query
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                searchProduct(searchQuery); // Search only when button is clicked
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.isEmpty ? products.length : searchResults.length,
                itemBuilder: (context, index) {
                  final product = searchResults.isEmpty ? products[index] : searchResults[index];
                  return ListTile(
                    title: Text(product['product']!),
                    subtitle: Text('Status: ${product['status']}'),
                    trailing: Text('Alternative: ${product['alternative']}'),
                    onTap: () {
                      _showProductModal(product); // Show modal only when item is clicked
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
