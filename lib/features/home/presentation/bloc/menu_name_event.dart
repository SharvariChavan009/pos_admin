import 'package:flutter/material.dart';

import '../../users/data/user_data.dart';

abstract class MenuNameEvent {}

class MenuNameSelected extends MenuNameEvent {
  final BuildContext context; // Context to be passed
  final String menuName; // Menu name to be passed
  User? selectedUser;
  MenuNameSelected({required this.context, required this.menuName,this.selectedUser});
}
