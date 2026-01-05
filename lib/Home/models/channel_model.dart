class ChannelModel {
  String? name;
  String? logo;
  String? url;
  
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
      
      // Fake Categories
      categories: [CategoryModel(name: "Entertainment", code: "ENT")],
      
      // Fake Country with the required 'code' (GL = Global)
      countries: [CategoryModel(name: "Global", code: "GL")],
      
      // Fake Language
      languages: [CategoryModel(name: "English", code: "EN")],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "logo": logo,
      "url": url,
      "categories": [],
      "countries": [],
      "languages": []
    };
  }
}

class CategoryModel {
  String? name;
  String? id;
  String? code; // <--- This is the missing piece you just found!

  CategoryModel({this.name, this.id, this.code});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? "General",
      id: json['id']?.toString() ?? "0",
      code: json['code'] ?? "GL", // Default to Global if missing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "code": code,
    };
  }
}
