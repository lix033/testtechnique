import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewWallet extends StatefulWidget {
  const NewWallet({super.key});

  @override
  State<NewWallet> createState() => _NewWalletState();
}

class _NewWalletState extends State<NewWallet> {
  Color _selectedColor = Colors.blue;
  String _selectedCurrency = 'XOF';
  String _selectedAccountType = 'Regular';

  final List<Color> _presetColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> _presetCurrency = [
    "Regular",
    "USD",
    "EUR",
    "GYP",
    "YEN",
    "GHC"
  ];
  final List<String> _preseAccountType = [
    "Regular",
    "Expenses",
    "........",
    "........",
    "........",
  ];
  bool isChecked = true;

// fonction pour menu type de compte
  void _openAccountTypeMenu(BuildContext context) async {
    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, 0),
      items: _preseAccountType.map((accounttype) {
        return PopupMenuItem<String>(
          value: accounttype,
          child: Text(accounttype),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() {
        _selectedAccountType = result;
      });
    }
  }

  // fonction choix de monnaie
  void _openCurrencyMenu(BuildContext context) async {
    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(0, 0, 0, 0),
      items: _presetCurrency.map((currency) {
        return PopupMenuItem<String>(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() {
        _selectedCurrency = result;
      });
    }
  }

// Fonction choix couleurrrrrr
  void _openColorPicker() async {
    Color? newColor = await showDialog<Color>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sélectionnez une couleur'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              availableColors: _presetColors,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    if (newColor != null) {
      setState(() {
        _selectedColor = newColor;
      });
    }
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
              child: Text("New wallet"),
            ))
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey, // Couleu
            height: 0.3, // Haute
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Preview',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
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
                              width: 5), 
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
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        '1,686,858 XOF',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                  label: Text(
                    'Account name',
                    style: TextStyle(color: Color(0xFFDADCE0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFDADCE0)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                  label: Text(
                    'Account number or ID',
                    style: TextStyle(color: Color(0xFFDADCE0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFDADCE0)),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      // readOnly: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                        label: Text(
                          'Icon',
                          style: TextStyle(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFFDADCE0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                        label: Text(
                          'Color',
                          style: TextStyle(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFFDADCE0)),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _openColorPicker,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _selectedColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const ImageIcon(
                                AssetImage(
                                  'assets/icons/iconarrow.png',
                                ),
                                color: Colors.blueAccent,
                              ),
                              // const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                  label: Text(
                    'Description',
                    style: TextStyle(color: Color(0xFFDADCE0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFDADCE0)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                  label: Text(
                    'Account type',
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFDADCE0)),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _openAccountTypeMenu(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            _selectedAccountType,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const ImageIcon(
                          AssetImage(
                            'assets/icons/iconarrow.png',
                          ),
                          color: Colors.blueAccent,
                        ),
                        // const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                  label: Text(
                    'Account currency',
                    style: TextStyle(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Color(0xFFDADCE0)),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _openCurrencyMenu(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            _selectedCurrency,
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const ImageIcon(
                          AssetImage(
                            'assets/icons/iconarrow.png',
                          ),
                          color: Colors.blueAccent,
                        ),
                        // const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color(
                        0xFFDADCE0)), 
                borderRadius: BorderRadius.circular(
                    8.0), 
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('Add balance to net worth'),
                  Spacer(), 
                  Switch(
                    value: isChecked,
                    onChanged: (bool newValue) {
                      setState(() {
                        isChecked = newValue; 
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () {},
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white, height: 4.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
