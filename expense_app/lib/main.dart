import 'package:expense_app/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: Expenses(),
  ));
}
