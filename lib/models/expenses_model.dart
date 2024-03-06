// class ExpensesList{
//   int? id;
//   int? date;
//   int? category;
//   int? wallet;
//   int? amount;
//   String? description;

//   ExpensesList({
//     this.id,
//     this.date,
//     this.category,
//     this.wallet,
//     this.amount,
//     this.description,
//   });

//   //maper le json ua model article

//   factory ExpensesList.fromJson(Map<String, dynamic>json){
//     return ExpensesList(
//       id: json['id'],
//       date: (json['date']),
//       category: json['category'],
//       wallet: json['wallet'],
//       amount: int.parse(json['amount']),

//       // amount: json['amount'],
//       description: json['description'],
     
//     );
//   }


// }
class ExpensesList {
  int? id;
  int? date;
  int? category;
  int? wallet;
  int? amount;
  String? description;

  ExpensesList({
    this.id,
    this.date,
    this.category,
    this.wallet,
    this.amount,
    this.description,
  });

  factory ExpensesList.fromJson(Map<String, dynamic> json) {
    int? parsedAmount;
    try {
      // Attempt to parse 'amount' to integer
      parsedAmount = int.parse(json['amount']);
    } catch (e) {
      // Handle parsing errors
      print('Error parsing amount: $e');
    }
    
    return ExpensesList(
      id: json['id'],
      date: json['date'],
      category: json['category'],
      wallet: json['wallet'],
      amount: parsedAmount,
      description: json['description'],
    );
  }
}
