class FoodModel {
  String name;
  String image;
  String price;
  String description;

  FoodModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
