import 'package:flutter/material.dart';
const double textSize = 22;
class ListviewDemo extends StatelessWidget {
  const ListviewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return Divider(thickness: 2);
      },
      itemBuilder: (context, index) {
        return Text("Item # ${index}", style: TextStyle(fontSize: textSize));
      },
);

// return ListView.builder(
    //   itemCount: 20,
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: (context, index) {
    //     return Text("Item # ${index}", style: TextStyle(fontSize: textSize));
    //   },
    // );
  }
}