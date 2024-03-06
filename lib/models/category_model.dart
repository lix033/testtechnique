class Category {
  int? id;
  String? color;
  String? name;
  String? description;
  String? type;
  String? currency;

  Category({
    this.id,
    this.color,
    this.name,
    this.description,
    this.type,
    this.currency,
  });

  factory Category.fromJson(Map<String, dynamic> json) { 
    return Category(
      id: json['id'],
      color: json['color'],
      name: json['name'],
      description: json['description'],
      type: json['type'], 
      currency: json['currency'],
    );
  }
}
