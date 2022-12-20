import 'package:my_shop/constance.dart';
import 'package:my_shop/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {

  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database ;

  Future<Database> get database async {
    if(_database != null) return _database! ;

    _database = await initDb();
    return _database!;
  }

  _onUpgrade(Database db , int oldVersion , int newVersion){
    print('onUpgrade <==============================================================>');
  }

  initDb() async {
    String path = join(await getDatabasesPath() , 'CartProduct.db');

    return await openDatabase(path ,
      version: 2 , onCreate: (Database db , int version ) async {
          await db.execute('''
              CREATE TABLE $tableCartProduct (
              $columnName TEXT NOT NULL,
              $columnImage TEXT NOT NULL,
              $columnQuantity INTEGER NOT NULL,
              $columnPrice TEXT NOT NULL,
              $columnProductId TEXT NOT NULL)
          ''');
        }, onUpgrade: _onUpgrade
    );
  }

  updateProduct(CartProductModel model) async{
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, model.toJson() ,
      where: '$columnProductId = ?' , whereArgs: [model.productId]
    );
  }

  Future<List<CartProductModel>> getAllProducts () async {
    var dbClient = await database ;
    List<Map> maps = await dbClient.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty ?
        maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async{
    var dbClient = await database;

    await dbClient.insert(
        tableCartProduct,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

}