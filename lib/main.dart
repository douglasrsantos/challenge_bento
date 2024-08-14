
import 'package:flutter/material.dart';

import 'package:challenge_bento/app/core/injection/service_locator.dart';
import 'package:challenge_bento/app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  
  debugInvertOversizedImages = true; //TODO: REMOVE

  setupDependencies();

  runApp(const App());
}
