import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'product_data.dart'; // Import your product data file

class HomePageContent extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  late List<Product> products; // Declare products as late to initialize later
  List<Product> searchResults = [];
  String searchQuery = "";

  // Debounce timer for better search performance
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    loadProducts(); // Load products when the widget initializes
  }

  // Load products from ProductData
  Future<void> loadProducts() async {
    products = ProductData.getProducts(); // Assuming this returns the product list
    setState(() {});
  }

  // Function to search products dynamically but not show modal until clicked
  void searchProductSuggestions(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }

    List<Product> results = products.where((product) {
      final productName = product.product.toLowerCase();
      return productName.contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = results;
    });
  }

  // Function to search product after user submits
  void searchProduct(String query) {
    List<Product> results = products.where((product) {
      final productName = product.product.toLowerCase();
      return productName.contains(query.toLowerCase());
    }).toList();

    if (results.isNotEmpty) {
      _showProductModal(results.first);
    } else {
      _showNotFoundModal();
    }
  }

  // Function to show product details in a modal
  void _showProductModal(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            product.product,
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
                'Alternative Product: ${product.alternative}',
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
                  final product = searchResults.isEmpty
                      ? products[index]
                      : searchResults[index];
                  return ListTile(
                    title: Text(product.product),
                    subtitle: Text(
                      'Category: ${product.category}, Status: ${product.status}'),
                    trailing: Text('Alternative: ${product.alternative}'),
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
