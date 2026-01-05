class ChannelModel {
  String? name;
  String? logo;
  String? url;
  // We keep this as a List because home.dart expects a List!
  List<CategoryModel>? categories; 

  ChannelModel({this.name, this.logo, this.url, this.categories});

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      name: json['name'] ?? "Unknown Channel",
      logo: json['logo'] ?? "",
      url: json['url'] ?? "",
      // MAGIC FIX: We force-create a "General" category so the app is happy.
      categories: [
        CategoryModel(name: "Entertainment") 
      ]
    );
  }
}

class CategoryModel {
  String? name;
  String? id;

  CategoryModel({this.name, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? "General",
      id: json['id'].toString(),
    );
  }
}
