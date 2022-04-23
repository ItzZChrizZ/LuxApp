// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luxapp/components/Productpage/image_swiper.dart';
import 'package:luxapp/components/Productpage/product_size.dart';
import 'package:luxapp/components/custom_actionbar.dart';
import 'package:luxapp/constants.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productRef =
      FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
              future: _productRef.doc(widget.productId).get(),
              builder: (context, productSnapshot) {
                if (productSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error : ${productSnapshot.error}"),
                    ),
                  );
                }

                if (productSnapshot.connectionState == ConnectionState.done) {
                  var docData = productSnapshot.data as DocumentSnapshot;
                  List imageList = docData['images'];
                  List productSize = docData['size'];

                  return ListView(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    children: [
                      ImageSwiper(imagelist: imageList),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "${docData['name']}",
                          style: Constants.regularHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "\$${docData['price']}",
                          style: Constants.regularHeadingRed,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "Select Size",
                          style: Constants.regularText,
                        ),
                      ),
                      ProductSize(productSizes: productSize),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "${docData['desc']}",
                          style: Constants.regularText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: Alignment.center,
                              height: 60.0,
                              width: 60.0,
                              child: const Image(
                                height: 25.0,
                                image: AssetImage(
                                  "assets/icons/ribbon.png",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 60.0,
                                margin: const EdgeInsets.only(
                                  left: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Add To Cart",
                                  style: Constants.addCart,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            const CustomActionBar(title: "", hasBackArrow: true),
          ],
        ),
      ),
    );
  }
}
