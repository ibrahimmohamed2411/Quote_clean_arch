import 'package:flutter/material.dart';
import 'package:quotes/injection_container.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(QuoteApp());
}
