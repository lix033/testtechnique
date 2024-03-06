import 'package:flutter/material.dart';
import 'package:hubtest/models/api_response.dart';
import 'package:hubtest/models/expenses_model.dart';
import 'package:hubtest/screens/categorieadd.dart';
import 'package:hubtest/screens/newexpensepage.dart';
import 'package:hubtest/services/constant.dart';
import 'package:hubtest/services/expenselist_services.dart';

class Myexpenses extends StatefulWidget {
  const Myexpenses({super.key});

  @override
  State<Myexpenses> createState() => _MyexpensesState();
}

class _MyexpensesState extends State<Myexpenses> {
  List<dynamic> _expencesList = [];
  bool _loading = true;

 Future<void> retrievesExpences() async {
    ApiResponse response = await getAllExpences();

    if (mounted) {
      if (response.error == null) {
        setState(() {
          _expencesList = response.data as List<dynamic>;
          // print(_expencesList);
          _loading = _loading ? !_loading : _loading;
        });
      } else if (response.error == somethingwentwrong) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => categorieAdd()),
            (route) => false);
      }
    }
  }

    @override
  void initState() {
    retrievesExpences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person_outline_rounded)),
            Expanded(
                child: Center(
              child: Text("MM"),
            )),
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewExpense()));
            }, icon: Icon(Icons.add))
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Hauteur
          child: Container(
            color: Colors.grey, // Couleu
            height: 0.3, // Haute
          ),
        ),

      ),

      body: _loading? 
      Center(child: CircularProgressIndicator(color: Colors.black,)) :
      ListView.builder(
        itemCount: _expencesList.length,
        itemBuilder: (BuildContext context, int index){
          ExpensesList expencesList = _expencesList[index];
          return Container(
//  margin: EdgeInsets.all(6),
                      // padding: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 233, 241, 255),
                child: ImageIcon(
                  AssetImage('assets/icons/coins.png'),
                  color: Colors.blueAccent,
                  ),
              ),
              title: Text('${expencesList.description}',
              style: TextStyle(
                fontSize: 18.0
              ),),
              subtitle: Text('8 Septembre 2023'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('2500',
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text('XOF')
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}