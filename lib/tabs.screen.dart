import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/views/categories.screen.dart';
import 'package:meals_app/features/favorites/favorites.screen.dart';

import 'features/components/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List< Map< String, Object > > _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoritesScreen(), "title": "Favorites"},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]["title"].toString()),
        ),
        //Drower
        drawer: Drawer(
          child: CustomDrawer(),
        ),

        body: Text(_pages[_selectedPageIndex]["page"].toString()),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).focusColor,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites"),
          ],
        ),
      ),
    );
  }
}
