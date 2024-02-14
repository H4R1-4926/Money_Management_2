// ignore_for_file: file_names

import 'package:fire_base_project/Domain/Home/model/firebaseModel.dart';

abstract class IFirebaseRepo {
  Future<List<FireBaseModel>> getAll();
  Future<void> createFunc(FireBaseModel transaction);
  Future<void> deleteFunc(String id);
}
