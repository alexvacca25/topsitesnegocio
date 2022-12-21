

import 'package:flutter/material.dart';

class RowColumnResponsive extends StatelessWidget {

  final List<Widget> children;
  final bool condicion;

  const RowColumnResponsive({super.key, required this.children, required this.condicion});

  @override
  Widget build(BuildContext context) {
    return condicion ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        children.length, 
        (index) => Expanded(
          child: Padding(
            // padding: EdgeInsets.all(0),
            padding: 
              children.length == 1 ?
                const EdgeInsets.symmetric(vertical: 0 ) :
              index == 0 ? 
                const EdgeInsets.only(right: 10, top: 10, bottom: 0) :  
              index == (children.length - 1) ? 
                const EdgeInsets.only(left: 10, top: 10, bottom: 0) : 
                const EdgeInsets.only(right: 10, top: 10, left: 10), 
            child: children[index],
          )
        )
      ),
      // children: children.map((e) => Expanded(child: Padding(padding: EdgeInsets.all(10),child: e,))).toList(),
    ):
    Column(
      children: children.map((e) => Padding(
        // padding: const EdgeInsets.symmetric(vertical:5),
        padding: EdgeInsets.all(0),
        child: Row(children: [Expanded(child: e)],),
      )).toList(),
    );
  }
}