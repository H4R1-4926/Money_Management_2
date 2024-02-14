import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_project/Domain/Home/i_firebaseModel_repo.dart';
import 'package:fire_base_project/Domain/Home/model/firebaseModel.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: IFirebaseRepo)
class Func implements IFirebaseRepo {
  @override
  Future<List<FireBaseModel>> getAll() async {
    List<FireBaseModel> transaction = [];
    final getDoc =
        await FirebaseFirestore.instance.collection('transaction').get();
    try {
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in getDoc.docs) {
        transaction.add(FireBaseModel.fromMap(document.data(), document.id));
      }
      log(transaction.toString());
      return transaction;
    } catch (e) {
      log('Err in $e');
      return [];
    }
  }

  @override
  Future<void> createFunc(FireBaseModel transaction) async {
    try {
      await FirebaseFirestore.instance
          .collection('transaction')
          .add(transaction.toMap());
      log('Transaction added successfully!');
    } catch (e) {
      log('Error adding transaction: $e');
    }
  }

  @override
  Future<void> deleteFunc(String id) async {
    try {
      final data = FirebaseFirestore.instance.collection('transaction').doc(id);
      await data.delete();
      log('Deleted Succesfully');
    } catch (e) {
      log('error found: $e');
    }
  }
}
