import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/device_dimension.dart';

Widget buildContentColumn(context, TabController tabController) {
  return Expanded(
    flex: (DeviceUtils.getDeviceDimension(context).width) > 1000
        ? 10
        : (DeviceUtils.getDeviceDimension(context).width) > 900
            ? 8
            : 6,
    child: Column(
      children: [
     SizedBox(
         height: DeviceUtils.getDeviceDimension(context).height,
          child: Column(
      children: [
        headerPart(context),
        middleBody(),
        bottomPart(),
      ],
    ),
  ),
      ],
    ),
  );
}


Widget headerPart(BuildContext context){
  return Container(
    color: Colors.deepOrangeAccent,
  );
}

Widget middleBody(){
  return Container(
    color: Colors.yellow,
  );
}

Widget bottomPart(){
  return Container(
    color: Colors.deepOrangeAccent,
  );
}