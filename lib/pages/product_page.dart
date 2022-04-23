// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_actionbar.dart';

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
      body: Stack(
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
                Map<String, dynamic> documentData =
                    productSnapshot.data! as Map<String, dynamic>;
                return ListView(
                  children: [
                    Image.network(
                      "${documentData['images'][0]}",
                      fit: BoxFit.cover,
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
    );
  }
}
