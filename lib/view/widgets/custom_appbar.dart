import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key,required this.child,this.actionsChild});
  final Widget child;
  final Widget? actionsChild;


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                          color: Colors.transparent,),
                    ),
                  ),
      elevation: 0,
      backgroundColor: Colors.black12,
      title: child,
      actions: actionsChild == null ? [] : [actionsChild!],
      );
  }
}