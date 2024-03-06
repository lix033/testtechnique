import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

Widget _buildButton(String text, {Color? color}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          
          print('Button');
        },
        style: ElevatedButton.styleFrom(
          primary: color ?? Colors.white,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    ),
  );
}

Widget _buildOperatorButton(ImageIcon icone, {Color? color}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          print(' icon pressed');
        },
        style: ElevatedButton.styleFrom(
          primary: color ?? Colors.white,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        child: icone,
      ),
    ),
  );
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.close)),
            Expanded(
                child: Center(
              child: Text("New expense"),
            ))
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Hauteur
          child: Container(
            color: Colors.grey, // Couleu
            height: 0.3, // Haute
          ),
        ),

        // padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(20.0),
              child: Text(
                '${DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.now())}',
                style: TextStyle(fontSize: 15.0, backgroundColor: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color.fromARGB(255, 243, 243, 245)),
              width: double.infinity,
              height: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'XOF',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    '8,000',
                    style: TextStyle(
                      fontSize: 70.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(5.0)),
      
                  // SizedBox(height: 10,),
                  Text(
                    'From account',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(
                              0xFFDADCE0)), 
                      borderRadius: BorderRadius.circular(
                          8.0), 
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage('assets/icons/bank.png'),
                                 
                                  size: 25,
                                ), 
                                SizedBox(
                                    width:
                                        5), 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'UBA bank',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      'S545FD545',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]
                            //  SizedBox(height: 5), // 
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              '1,686,858 XOF',
                              style: TextStyle(fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
      
                  Text(
                    'To category',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(
                              0xFFDADCE0)), 
                      borderRadius: BorderRadius.circular(
                          8.0), 
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                ),
      
                                SizedBox(
                                    width:
                                        10.0), 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Utilities',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
      
                            //  SizedBox(height: 5), 
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          // border: Border.all(color: Color(0xFFDADCE0)),
          // borderRadius: BorderRsadius.circular(3.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('/'),
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildOperatorButton(ImageIcon(AssetImage('assets/icons/delete.png'),color: Colors.black,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('x'),
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildOperatorButton(ImageIcon(AssetImage('assets/icons/percentage.png'),color: Colors.black,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('-'),
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildOperatorButton(ImageIcon(AssetImage('assets/icons/bank.png'),color: Colors.black,)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('+'),
            _buildButton('0'),
            _buildButton('0'),
            _buildButton('.', ),
            _buildOperatorButton(ImageIcon(AssetImage('assets/icons/check.png'),color: Colors.white,), color: Colors.black),
          ],
        ),
          ],
        ),
      ),
      
      
      
          ],
        ),
      ),
    );
  }
}
