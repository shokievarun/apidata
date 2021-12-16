import 'dart:math';

import 'package:apihttp/models/products.dart';
import 'package:apihttp/product_dao.dart';
import 'package:apihttp/services/remoteservices.dart';
import 'package:apihttp/viewa/homepage.dart';
import 'package:apihttp/viewa/homepage.dart';
import 'package:get/state_manager.dart';
import 'dart:developer' as developer;

import 'package:sembast/sembast.dart';

import '../app_database.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Welcome>[].obs;
  List<Welcome> product = <Welcome>[].obs;
//  Future<List<Welcome>> datas;
//  List<Welcome> prods= homePage

  ProductDao productDao;
  // HomePage homePage;

//  List<int>.empty(growable: true);
//  List<Todo> todos = [].obs;
//  var todos = <Todo>[].obs;
  Future<Database> get _db async {
    return await AppDatabase.instance.database;
  }

  @override
  void onInit() {
    productDao = ProductDao();
    //   homePage = HomePage();
    fetchProducts();
    //   datas = productDao.getAllSortedById();
    //  product = productList;
    print("onInit state");
    //  _productDao = ProductDao();
    //  _productDao.insert(productList.first);
    //   _productDao.insert(productList.last);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("onClose called");
    super.onClose();
  }

  @override
  void onReady() {
    product = productList;
    developer.log("default log", name: "Crossed");
    //     productDao.debugDatabaseProduct();

    // TODO: implement onReady
    print("render state");
    super.onReady();
  }

  void fetchProducts() async {
    //   await Future.delayed(Duration(seconds: 1));
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

/*

  Future<List<Welcome>> getAllSortedBydata() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await productDao.productStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final product = Welcome.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      product.id = snapshot.key;
      return product;
    }).toList();
  }
*/

  void insertProducts(int random) {
    productDao.insert(product[random]);
    productDao.debugDatabaseProduct();
    getAllSortedById();
    update();
  }

  Future<List<Welcome>> getAllSortedById() async {
    // Finder object can also sort data.
    //   await Future.delayed(const Duration(milliseconds: 500));
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await productDao.productStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final product = Welcome.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      product.id = snapshot.key;
      return product;
    }).toList();
  }


  void deleteProducts(Welcome deleteprod) {
    productDao.delete(deleteprod);
    getAllSortedById();
    update();
  }

  void updateProducts(Welcome random) {
    developer.log("default ", name: "entered controller");
//    developer.log("default ", name: "${product[random].id}");
//    add  random products here
    Random randomnum = new Random();
    int randomNumber = randomnum.nextInt(100);
    //  Welcome data = product[randomNumber];
    productDao.update(product[randomNumber]);
    developer.log("default ", name: "${product[randomNumber].id}");
    getAllSortedById();
    update();
    //   productDao.debugDatabaseProduct();
  }
}
