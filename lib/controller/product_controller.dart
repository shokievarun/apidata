import 'package:apihttp/models/products.dart';
import 'package:apihttp/product_dao.dart';
import 'package:apihttp/services/remoteservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/state_manager.dart';
import 'dart:developer' as developer;

import 'package:sembast/sembast.dart';

import '../app_database.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Welcome>[].obs;
//  List<Welcome> product = <Welcome>[].obs;

  ProductDao productDao;
  Future<Database> get _db async {
    return await AppDatabase.instance.database;
  }

  @override
  void onInit() {
    productDao = ProductDao();
    fetchProducts();

    print("onInit state");
    super.onInit();

    /*  Future.delayed(const Duration(milliseconds: 500), () {
      insertProducts(1);
    });*/
    /*  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      insertProducts(1);
    });*/
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("onClose called");
    super.onClose();
  }

  @override
  Future<void> onReady() {
    developer.log("default log", name: "Crossed");
    //   insertProducts(1);
    // TODO: implement onReady
    print("render state");
    super.onReady();
  }

  /* addProducts() {
    int a = 1;
    //  if (a < 100) {
    developer.log("default log", name: "${a}");
    insertProducts(a);
    developer.log("default log", name: "${a}");
    //   a++;
    //  }
  }
*/
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
      developer.log("list ", name: "${productList.length}");
      //    product = productList;
    } finally {
      isLoading(false);
    }
  }

  void insertProducts(int random) {
    productDao.insert(productList[random]);
    productDao.debugDatabaseProduct();

    update();
  }

  void deleteProducts(Welcome deleteprod) {
    productDao.delete(deleteprod);

    update();
  }

  void updateProducts(Welcome random) {
    developer.log("inside controller before update ", name: "${random.id}");
    productDao.update(random);
    update();
    developer.log("inside controller after update", name: "${random.id}");
  }
}
