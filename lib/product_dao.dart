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
  final productStore = intMapStoreFactory.store(PRODUCT_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async {
    return await AppDatabase.instance.database;
  }

  Future insert(Welcome product) async {
    //  await Future.delayed(const Duration(milliseconds: 500));
    await productStore.add(await _db, product.toJson());

    //  await _productStore.record(product.toJson()).put(_db, 'my_data');
  }

  Future update(Welcome product) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // final finder = Finder(filter: Filter.byKey(product.id));
    Finder finder = Finder(filter: Filter.equals('key', product.id));
    await productStore.update(await _db, product.toJson());
    developer.log("default ", name: "entered dao");
    developer.log("default ", name: "${product.id}");

    //   getAllSortedById();
  }

  Future delete(Welcome product) async {
    //  await Future.delayed(const Duration(milliseconds: 500));
    final finder = Finder(filter: Filter.byKey(product.id));
    await productStore.delete(
      await _db,
      finder: finder,
    );

    //  getAllSortedById();
  }

  Future debugDatabaseProduct() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);

    final recordSnapshots = await productStore.find(
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
