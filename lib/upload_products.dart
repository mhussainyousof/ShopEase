import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

Future<void> uploadProducts() async {
  final String response = await rootBundle.loadString('assets/data/products.json');
  final List<dynamic> products = json.decode(response);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference productsRef = firestore.collection('Products');

  for (int i = 0; i < products.length; i++) {
    final String docId = (i + 2).toString().padLeft(3, '0'); // از 002 شروع
    final docExists = await productsRef.doc(docId).get();

    if (!docExists.exists) {
      await productsRef.doc(docId).set(products[i]);
      print("Uploaded product $docId");
    } else {
      print("Product $docId already exists, skipping...");
    }
  }

  print("✅ All products processed.");
}