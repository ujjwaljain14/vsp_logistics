

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';
import 'package:vsp_logistics/res/routes/routes.dart';

import '../../res/routes/routes_name.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: const Text("Get Ladle Details"),
        ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 20.0, // spacing between rows
          crossAxisSpacing: 20.0,
          childAspectRatio: 2// spacing between columns
        ),
        padding: const EdgeInsets.all(8.0), // padding around the grid
        itemCount: 30, // total number of items
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                  RoutesName.searchLadle,
                arguments: {
                    "name": index + 1,
                }
              );
              // do something
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff00CDAC),
                    AppColor.buttonColor,
                  ],
                ),
              ),// color of grid items
              child: Center(
                child: Text(
                  "Ladle ${index + 1}",
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          );
        },
      )
      );
  }
}
