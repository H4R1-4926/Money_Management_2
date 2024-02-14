// ignore_for_file: file_names, must_be_immutable

import 'dart:developer';

import 'package:fire_base_project/Application/bloc/home_bloc.dart';
import 'package:fire_base_project/Core/Colors/color.dart';
import 'package:fire_base_project/Domain/Home/model/firebaseModel.dart';
import 'package:fire_base_project/Infrastucture/Home/firebase_pro_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final _puposetextcontroller = TextEditingController();
  final _amounttextcontroller = TextEditingController();
  String? _selectedval;

  @override
  Widget build(BuildContext context) {
    final category = ['Expense', 'Income'];
    return Scaffold(
      backgroundColor: kLightGreen,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _puposetextcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: const Text(
                          'Purpose',
                          style: TextStyle(color: kDarkGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kDarkGreen,
                            ),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _amounttextcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        label: const Text(
                          'Amount',
                          style: TextStyle(color: kDarkGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: kDarkGreen,
                            ),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  DropdownButtonFormField(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    hint: const Text('Category'),
                    value: _selectedval,
                    items: category.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      _selectedval = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveData();
                      context.read<HomeBloc>().add(const Created());
                      Get.back();
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(kDarkGreen),
                        foregroundColor: MaterialStatePropertyAll(kLightGreen)),
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> saveData() async {
    final text = _puposetextcontroller.text;
    final amount = _amounttextcontroller.text;
    final cate = _selectedval;
    log(cate.toString());

    // ignore: no_leading_underscores_for_local_identifiers
    final _newData = FireBaseModel(
        id: '', title: text, rupees: amount, category: cate ?? '');

    if (text.isNotEmpty || amount.isNotEmpty) {
      await Func().createFunc(_newData);
    } else {
      Get.back();
    }
  }
}
