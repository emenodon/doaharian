import 'package:doaharian/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'ui/doall.dart';

void main() {
  runApp(MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'Doa Dong',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
        canvasColor: Colors.transparent,
      ),
      home: MyApp()
      // initialRoute: Doall.routeName,
      // routes: {
      //   Doall.routeName: (context) => const Doall(),
      // },
      ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
// return MaterialApp(
//   title: 'Flutter Demo',
//   theme: ThemeData(
//     primarySwatch: Colors.deepPurple,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   ),
//   initialRoute: Doall.routeName,
//   routes: {
//     Doall.routeName: (context) => const Doall(),
//   },
// );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Doall(),
    DoaSearch(),
    Text(
      'Random',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300]!,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.library_books),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Aplikasi ini dibuat dengan cinta')));
            },
          ),
        ],
        elevation: 0,
        title: const Text(
          'DoaDong',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white54.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.deepPurple[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.deepPurple[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.random,
                  text: 'Random',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
