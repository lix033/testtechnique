class Wallet {
  int? id;
  String? value;
  String? name;
  int? balance;
  String? currency;
  String? description;

  Wallet({
    this.id,
    this.value,
    this.name,
    this.balance,
    this.currency,
    this.description,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) { 
    return Wallet(
      id: json['id'],
      value: json['value'],
      name: json['name'],
      balance: json['balance'],
      currency: json['currency'], 
      description: json['description'],
    );
  }
}
