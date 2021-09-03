import 'package:efresh/shared/bloc/app_cubit.dart';
import 'package:efresh/shared/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        final _cubit = AppCubit.get(context);
        return Scaffold(
          body: _cubit.screens[_cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('Cart'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Wishlist'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
            currentIndex: _cubit.index,
            onTap: (int index){
              _cubit.changeBottomNavState(index);
            },
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
