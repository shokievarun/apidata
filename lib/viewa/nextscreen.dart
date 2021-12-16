import 'package:apihttp/controller/product_controller.dart';
import 'package:apihttp/viewa/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
    final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.off(HomePage());
            //   Get.reset();
          },
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return ListView.builder(
                  itemCount: productController.productList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
//    Text("UserId: ${posts![index]["userId"]}",style: TextStyle(color: Colors.black, fontSize: 15),),
                            Text(
                              "ID:${productController.productList[index].id}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Text(
                              "Title: ${productController.productList[index].title}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            Text(
                              "Body:${productController.productList[index].body}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ],
                    );
                  },
                );
            }),
          ),
        ),
      ),
    );
  }
}
