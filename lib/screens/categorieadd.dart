import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hubtest/models/api_response.dart';
import 'package:hubtest/services/category_service.dart';
import 'package:hubtest/services/constant.dart';

class categorieAdd extends StatefulWidget {
  const categorieAdd({super.key});

  @override
  State<categorieAdd> createState() => _categorieAddState();
}

class _categorieAddState extends State<categorieAdd> {
  Color _selectedColor = Colors.blue;
  String _selectedCurrency = 'XOF';

  final List<Color> _presetColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> _presetCurrency = [
    "XOF",
    "USD",
    "EUR",
    "GYP",
    "YEN",
    "GHC"
  ];

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
                Navigator.of(context).pop(_selectedColor);
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
        // _txtcolorController.text = _selectedColor.toString();
         _txtcolorController.text = '#${_selectedColor.value.toRadixString(16).substring(2)}';
      
      });
    }
  }

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
              child: Text("New category"),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _txtnameController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                label: Text(
                  'Category name',
                  style: TextStyle(color: Color(0xFFDADCE0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFDADCE0)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _txtcolorController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                labelText: 'Color',
                labelStyle: TextStyle(color: Colors.grey),
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
                      ),
                      // const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _txtDescriptionController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                label: Text(
                  'Description',
                  style: TextStyle(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFDADCE0)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _txttypeController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                label: Text(
                  'Category type',
                  style: TextStyle(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFDADCE0)),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Expenses',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/iconarrow.png',
                        ),
                      ),
                      // const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              
              readOnly: true,
              onTap: () {
                _openCurrencyMenu(context);
              },

              controller: TextEditingController(text: _selectedCurrency),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                label: Text(
                  'Currency',
                  style: TextStyle(color: Colors.grey),
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
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/iconarrow.png',
                        ),
                      ),
                      // const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              // controller: _txt,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                label: Text(
                  'Add sub Category',
                  style: TextStyle(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFFDADCE0)),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Container(
                      //   child: Text('Expenses',
                      //   style: TextStyle(
                      //     color: Colors.grey
                      //   ),

                      //   ),
                      // ),
                      const SizedBox(width: 20),
                      const Icon(Icons.add),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: _categoryAdd,
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white, height: 4.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  final TextEditingController _txtcolorController = TextEditingController();
  final TextEditingController _txtnameController = TextEditingController();
  final TextEditingController _txtDescriptionController = TextEditingController();
  final TextEditingController _txttypeController = TextEditingController();
  final TextEditingController _txtcurrencyController = TextEditingController();

  bool _loading = false;

  void _categoryAdd() async {
    print(_txtcolorController.text);
    //  print('color:${_txtcolorController.text}');
         ApiResponse response = await newCategorieAdd(_txtcolorController.text, _txtnameController.text,_txtDescriptionController.text,_txttypeController.text,_txtcurrencyController.text);
    if (response.error == null) {
      _txtcolorController.clear();
      _txtnameController.clear(); 
      _txtDescriptionController.clear();
      _txttypeController.clear();
      _txtcurrencyController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('CATEGORY ADD AVEC SUCCES'),
        backgroundColor: Colors.green[400],
      ));
    } else if (response.error == unauthorized) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const categorieAdd()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
        backgroundColor: Colors.red[400],
      ));
      setState(() {
        _loading = !_loading;
      });
    }
  }
}
