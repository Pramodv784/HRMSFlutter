import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Base.dart';
import 'BaseProvider.dart';
import 'mid_layer.dart';


class RevDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseProvider>(
        create: (_) => BaseProvider(),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                MidLayer(),
               Base(),
              ],
            ),
          ),
        ));
  }
}
