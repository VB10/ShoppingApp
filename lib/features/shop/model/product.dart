import 'dart:convert';

class Product {
  String image;
  double price;
  String title;
  double weight;
  Product({
    this.image,
    this.price,
    this.title,
    this.weight,
  });

  Product copyWith({
    String image,
    double price,
    String title,
    double weight,
  }) {
    return Product(
      image: image ?? this.image,
      price: price ?? this.price,
      title: title ?? this.title,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'price': price,
      'title': title,
      'weight': weight,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      image: map['image'],
      price: map['price'],
      title: map['title'],
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  static Product fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(image: $image, price: $price, title: $title, weight: $weight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.image == image &&
        o.price == price &&
        o.title == title &&
        o.weight == weight;
  }

  @override
  int get hashCode {
    return image.hashCode ^ price.hashCode ^ title.hashCode ^ weight.hashCode;
  }
}

List<Product> dummyList = [
  Product(
      image: "https://kz.all.biz/img/kz/catalog/1316296.png",
      price: 7.77,
      title: "Macaroni of the Granoro n Spaghetti. 16 Capellini buy in Almaty",
      weight: 500),
  Product(
      image:
          "https://sc02.alicdn.com/kf/UTB8NueHviDEXKJk43Oq763z3XXa9/931808589/UTB8NueHviDEXKJk43Oq763z3XXa9.png",
      price: 11.27,
      title:
          "Italian Pasta,Granoro Penne Rigate N. 26 - Buy Italian Pasta Penne Rigate,Pasta,Italian Pasta Brands Product on Alibaba.com",
      weight: 500),
  Product(
      image: "https://sc02.alicdn.com/kf/UTB8v66ouo_4iuJk43Fq762.FpXa9.png",
      price: 7.74,
      title:
          "Italian Pasta,Granoro Nest Shaped Fettuccine - Buy Italian Pasta Brands,Italian Fettuccine,Italian Pasta Product on Alibaba.com",
      weight: 500),
  Product(
      image:
          "https://www.granoro.it/Contents/Images/20190110111627_42mezzigomiti_iclassici_cuscino.png",
      price: 5.27,
      title: "Short pasta | GRANORO - IL PRIMO",
      weight: 500)
];

Product singleModel = Product(
    image:
        "https://cdn.shopify.com/s/files/1/2786/0986/products/granoro-spaghetti-tagliati-n68-the-italian-shop-free-delivery_580x.png?v=1548429175",
    price: 1.19,
    title: "Granoro -Spaghetti Tagliati - N.68",
    weight: 500);
