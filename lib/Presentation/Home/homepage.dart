import 'package:fire_base_project/Application/bloc/home_bloc.dart';
import 'package:fire_base_project/Core/Colors/color.dart';
import 'package:fire_base_project/Infrastucture/Home/firebase_pro_repository.dart';
import 'package:fire_base_project/Presentation/AddScreen/addDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeEvent.started());
    });
    return Scaffold(
      backgroundColor: kLightGreen,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddPage());
          },
          backgroundColor: kDarkGreen,
          foregroundColor: kLightGreen,
          child: const Center(
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.snapshot.isNotEmpty) {
            state.snapshot;
          }
        },
        builder: (context, state) {
          if (state.err) {
            return Shimmer.fromColors(
                baseColor: kWhite,
                highlightColor: kDarkGreen,
                child: ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: ListTile(
                                title: Container(
                                  height: 20,
                                  width: 200,
                                  color: kBlack,
                                ),
                                subtitle: Container(
                                  height: 20,
                                  width: 200,
                                  color: kBlack,
                                ),
                                leading: const CircleAvatar(),
                              )),
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          height: 5,
                        ),
                    itemCount: 10));
          } else if (state.snapshot.isEmpty) {
            return const Center(
              child: Text(
                "Click '+' to Add",
                style: TextStyle(color: kDarkGreen),
              ),
            );
          }
          final len = state.snapshot;
          return ListView.separated(
            itemBuilder: (context, index) {
              final res = len[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: Text(res.title),
                    subtitle: Text(res.category),
                    leading: Text(
                      '${res.rupees}/-',
                      style: const TextStyle(fontSize: 25),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Func().deleteFunc(res.id);
                          context.read<HomeBloc>().add(const Deleted());
                        },
                        icon: const Icon(Icons.delete)),
                    tileColor: kWhite,
                  ),
                ),
              );
            },
            itemCount: len.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 5,
              );
            },
          );
        },
      ),
    );
  }
}
