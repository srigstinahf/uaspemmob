import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:uaspemmob/models/product.dart';
import 'package:uaspemmob/api/api_service.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ApiService _apiService;
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;
  Set<int> readBooks = {}; // Menyimpan ID produk yang telah ditandai
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _apiService = Get.find<ApiService>();
    _loadUserData();
    _fetchProducts();
    _searchController.addListener(() {
      _filterProducts(_searchController.text);
    });
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      readBooks = prefs.getStringList('read_books')?.map((e) => int.parse(e)).toSet() ?? {};
    });
  }

  Future<void> _fetchProducts() async {
    try {
      List<Product> products = await _apiService.fetchProducts();
      setState(() {
        _products = products;
        _filteredProducts = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      Get.snackbar(
        "Error",
        "Failed to fetch products: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _products
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _incrementReadBooks(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      readBooks.add(productId);
    });
    await prefs.setStringList('read_books', readBooks.map((e) => e.toString()).toList());
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.snackbar('Success', 'Logged out successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        elevation: 0,
        title: Text(
          'Welcome To Secret Garden',
          style: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.green.shade700),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.green.shade700),
            onPressed: _logout,
          ),
        ],
      ),
      body: Container(
        color: Colors.green.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Find Your Product...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade600),
                        ),
                      )
                    : _filteredProducts.isEmpty
                        ? Center(child: Text("No products available"))
                        : ListView.builder(
                            itemCount: _filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = _filteredProducts[index];
                              bool isRead = readBooks.contains(product.id);

                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: Icon(Icons.shopping_bag, size: 40, color: Colors.green.shade700),
                                  title: Text(
                                    product.name,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(product.description),
                                  trailing: ElevatedButton(
                                    onPressed: isRead
                                        ? null
                                        : () {
                                            _incrementReadBooks(product.id);
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isRead ? Colors.grey : Colors.green.shade600,
                                    ),
                                    child: Text(isRead ? "Read" : "Mark as Read"),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
