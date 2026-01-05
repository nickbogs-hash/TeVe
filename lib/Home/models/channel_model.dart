class ChannelModel {
  String? name;
  String? logo;
  String? url;
  
  // These are the lists the other screens were crying about
  List<CategoryModel>? categories; 
  List<CategoryModel>? countries;
  List<CategoryModel>? languages;

  ChannelModel({
    this.name, 
    this.logo, 
    this.url, 
    this.categories,
    this.countries,
    this.languages
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      name: json['name'] ?? "Unknown Channel",
      logo: json['logo'] ?? "",
      url: json['url'] ?? "",
      
      // FIX 1: We fake the categories
      categories: [CategoryModel(name: "Entertainment")],
      
      // FIX 2: We fake the countries (needed for channels_screen.dart)
      countries: [CategoryModel(name: "Global")],
      
      // FIX 3: We fake the languages
      languages: [CategoryModel(name: "English")],
    );
  }

  // FIX 4: The 'toJson' method needed for Favorites (player_service.dart)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "logo": logo,
      "url": url,
      // We return empty lists to keep the database clean
      "categories": [],
      "countries": [],
      "languages": []
    };
  }
}

class CategoryModel {
  String? name;
  String? id;

  CategoryModel({this.name, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? "General",
      id: json['id']?.toString() ?? "0",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
    };
  }
}
