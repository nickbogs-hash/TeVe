class ChannelModel {
  String? name;
  String? logo;
  String? url;
  String? category; // We will fake this if missing

  ChannelModel({this.name, this.logo, this.url, this.category});

  // This is the translator. It takes the new JSON and fits it into the app's boxes.
  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      name: json['name'] ?? "Unknown Channel",
      logo: json['logo'] ?? "",
      url: json['url'] ?? "",
      // The new list might not have categories, so we give it a default one
      category: json['category'] ?? "General", 
    );
  }
}

// We also need to fake the Category structure so the Home Screen doesn't crash
class CategoryModel {
  String? name;
  CategoryModel({this.name});
}
