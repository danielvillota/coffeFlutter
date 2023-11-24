import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAllCollection({required String nameCollection}) async {
  List data = [];

  CollectionReference collectionReference = db.collection(nameCollection);

  QuerySnapshot queryData = await collectionReference.get();

  for (var item in queryData.docs) {
    data.add(item.data());
  }

  return data;
}