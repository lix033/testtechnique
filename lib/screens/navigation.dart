import 'package:flutter/material.dart';
import 'package:hubtest/screens/dashboard.dart';
import 'package:hubtest/screens/myexpensespage.dart';
import 'package:hubtest/screens/newexpensepage.dart';
import 'package:hubtest/screens/newwalletpage.dart';
import 'package:hubtest/screens/statistics.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
    
    int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [Dash(),Myexpenses(), Stats(), NewWallet(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: principal_color,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          onTap: _navigateBottomBar,
          items:  [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/dashboard.png'),color: Colors.black87,),
              label: "Dashboard",
              // backgroundColor: principal_color,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/coinsswap.png'),color: Colors.black87,),
              label: "My expenses",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/codemeasur.png'),color: Colors.black87,),
              label: "Statistics",
              // backgroundColor: principal_color,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/settings.png'),color: Colors.black87,),
              label: "Settings",      
              // backgroundColor: principal_color,
            ),
           
          ],
        )
    );
  }
}