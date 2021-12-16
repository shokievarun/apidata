import 'dart:math';

import 'package:apihttp/controller/product_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sembast/sembast.dart';
import 'dart:developer' as developer;

import 'app_database.dart';
import 'models/products.dart';

class ProductDao {
  ProductController productController;
  static const String PRODUCT_STORE_NAME = 'products';
  //String x = 'abcd';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _productStore = intMapStoreFactory.store(PRODUCT_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async {
    return await AppDatabase.instance.database;
  }

  Future insert(Welcome product) async {
    //  await Future.delayed(const Duration(milliseconds: 500));
    await _productStore.add(await _db, product.toJson());

    //  await _productStore.record(product.toJson()).put(_db, 'my_data');
  }

  Future update(Welcome product) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    final finder = Finder(filter: Filter.byKey(product.id));
    //  Finder finder = Finder(filter: Filter.equals('key', product.id));
//    final Finder finder = Finder(filter: Filter.equals('userName', userName));
    // final result =
    developer.log("inside main before uodate ", name: "${product.id}");
    await _productStore.update(await _db, product.toJson(), finder: finder);
    //  await productStore.record(product.id).put(await _db, product.toJson());
    //   developer.log("default ", name: "entered dao");
    developer.log("inside main after uodate ", name: "${product.id}");
  }

  Future delete(Welcome product) async {
    //  await Future.delayed(const Duration(milliseconds: 500));
    final finder = Finder(filter: Filter.byKey(product.id));
    await _productStore.delete(
      await _db,
      finder: finder,
    );

    //  getAllSortedById();
  }

  Future<List<Welcome>> getAllSortedById() async {
    // Finder object can also sort data.
    //   await Future.delayed(const Duration(milliseconds: 500));
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await _productStore.find(
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

  Future debugDatabaseProduct() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await _productStore.find(
      await _db,
      finder: finder,
    );

    recordSnapshots.forEach((snapshot) {
      final Welcome product = Welcome.fromJson(snapshot.value);
      print(
          '{id: ${snapshot.key}, title: ${product.title}, body: ${product.body}}');
    });
  }
}
