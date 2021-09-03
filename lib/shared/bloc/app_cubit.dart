import 'package:bloc/bloc.dart';
import 'package:efresh/screens/cart_screen.dart';
import 'package:efresh/screens/home_screen.dart';
import 'package:efresh/shared/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../costants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // bottom nav bar change state
  int _selectedIndex = 0;
  List<Widget> _appScreens = [
    HomeScreen(),
    CartScreen(),
    Scaffold(),
    Scaffold(),
  ];

  int get index => _selectedIndex;

  List<Widget> get screens => _appScreens;

  void changeBottomNavState(int index) {
    _selectedIndex = index;
    emit(BottomNavBarChangeState());
  }

  //Local database change states
  Database _database;
  List<Map> _items;

  List<Map> get items => _items;

  void createDatabase() async {
    await openDatabase('fresh.db', version: 1, onCreate: (database, version) {
      print('database created');
      database
          .execute(
              'CREATE TABLE ${Constants.tableName} (${Constants.pId} INTEGER PRIMARY KEY, ${Constants.pName} TEXT, ${Constants.pImgUrl} TEXT, ${Constants.pPrice} REAL)')
          .then((value) => print('table created'))
          .catchError((e) => print('error when creating table'));
    }, onOpen: (database) {
      print('database opened');
      getDatabase(database);
    }).then((value) {
      _database = value;
      emit(CreateDatabaseState());
    });
  }

  void insertIntoDatabase(
      {@required String name,
      @required String imageUrl,
      @required double price}) async {
    await _database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO ${Constants.tableName}(${Constants.pName}, ${Constants.pImgUrl}, ${Constants.pPrice}) VALUES("$name", "$imageUrl", $price)')
          .then((value) {
        print('$value inserted');
        emit(InsertIntoDatabaseState());
        getDatabase(_database);
      }).catchError((e) => print('error when insert into database: $e'));
      return null;
    });
  }

  void getDatabase(Database database) {
    database.rawQuery('SELECT * FROM ${Constants.tableName}').then((value) {
      _items = value;
      emit(GetDataFromDatabaseState());
    });
  }

  void deleteData({@required int id}) {
    _database.rawDelete(
        'DELETE FROM ${Constants.tableName} WHERE ${Constants.pId} = ?',
        ['$id']).then((value) {
      emit(DeleteFromDatabaseState());
      getDatabase(_database);
    });
  }

  // add to cart button state
  bool _isItemAdded = false;
  int _id;

  bool get isItemAdded => _isItemAdded;

  int get id => _id;

  void changeAddToCartState({@required bool isAdded, @required int id}) {
    _isItemAdded = isAdded;
    _id = id;
    emit(AddToCartButtonChangeState());
  }

  //product quantity states
  int _quantity = 1;

  int get quantity => _quantity;

  void increaseItemQuantity(){
    _quantity ++;
    emit(IncreaseProductQuantityState());
}

void decreaseItemQuantity(){
  if(_quantity > 1){
    _quantity --;
  }
  emit(DecreaseProductQuantityState());
}

}
