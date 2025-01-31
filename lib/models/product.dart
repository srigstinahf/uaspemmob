class Product {
  final int id;
  final String name;
  final String description;
  final double price; // Pastikan price menggunakan double
  final String? imageUrl;

  Product({required this.id, required this.name, required this.description, required this.price,  this.imageUrl,});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'], // Menangani harga dalam format double
      imageUrl: json['imageUrl'], // Mengambil URL gambar dari API
    );
  }
}