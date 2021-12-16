import 'dart:math';
import 'dart:developer' as developer;
import 'package:apihttp/controller/product_controller.dart';
import 'package:apihttp/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'nextscreen.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              //    width: 100.w,
              height: 28.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset("assets/aura_normal_mode_PNG.svg",
                        fit: BoxFit.fitWidth),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 3.0, right: 3.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {
                                    Random random = new Random();
                                    int randomNumber = random.nextInt(100);
                                    productController
                                        .insertProducts(randomNumber);
                                  },
                                  child:
                                      SvgPicture.asset("assets/Hamburger.svg")),
                              Column(
                                children: [
                                  Text(
                                    "Well Being for IBS",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  Text(
                                    "Tuesday December 07",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
                                ],
                              ),
                              FloatingActionButton(
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {
                                    Get.to(NextScreen());
                                  },
                                  child: SvgPicture.asset(
                                      "assets/report-menu.svg")),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Week 1: Path Conditioning",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade100,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                //   width: 100.w,
                //   height: 100.h,
                color: CupertinoColors.white,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset("assets/nueron_bg.svg",
                          fit: BoxFit.fitWidth),
                    ),
                    SafeArea(
                      child: Obx(() {
                        if (productController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 20, 15.0, 10.0),
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  //      height: 17.h,
                                  //       width: 90.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Well Being Programming",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: 'OpenSans'),
                                      ),
                                      //          SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Sun-icon.svg"),
                                            height: 8.h,
                                            width: 8.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Evening-placebo.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Evening-placebo.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Evening-placebo.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Moon-icon.svg"),
                                            height: 7.h,
                                            width: 7.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  //       height: 17.h,
                                  //      width: 90.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "My Journals",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: 'OpenSans'),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/large-water.svg"),
                                            height: 6.h,
                                            width: 6.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/food.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Bowel.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                          Container(
                                            child: SvgPicture.asset(
                                                "assets/Flare-up.svg"),
                                            height: 8.h,
                                            width: 12.w,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Todays Recordings",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'OpenSans'),
                                  ),
                                  SizedBox(width: 15.0),
                                  Icon(Icons.watch_later_rounded),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SafeArea(
                                  child: GetBuilder<ProductController>(
                                init: ProductController(),
                                builder: (productController) {
                                  return FutureBuilder<List<Welcome>>(
                                      future: productController.productDao
                                          .getAllSortedById(),
                                      builder: (context, future) {
                                        if (!future.hasData)
                                          return CircularProgressIndicator(); // Display empty container if the list is empty
                                        else {
                                          List<Welcome> lists = future.data;
                                          return ListView.builder(
                                              physics: ScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: lists.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: Text(lists[index]
                                                      .id
                                                      .toString()),
                                                  title:
                                                      Text(lists[index].title),
                                                  /*  subtitle:
                                                          Text(list[index].body),*/
                                                  trailing: buildRow(lists,
                                                      index, productController),
                                                );
                                              });
                                          //    );
                                        }
                                      });
                                },
                              ))
                            ]),
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(
      List<Welcome> lists, int index, ProductController productController) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              developer.log("before update ", name: "${lists[index].id}");
              lists[index].title = lists[index].title + "abc";
              //       lists[index].id = lists[index].id + 1;
              developer.log("value change ", name: "${lists[index].id}");
              productController.updateProducts(lists[index]);
              developer.log("after update ", name: "${lists[index].id}");
            }),
        IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            productController.deleteProducts(lists[index]);
          },
        ),
      ],
    );
  }
}
