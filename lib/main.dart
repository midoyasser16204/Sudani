import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sudani_app/sudani.dart';
import 'core/configuration/firebase_options.dart';
import 'core/constants/strings.dart';
import 'core/di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Strings.envLocation);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.instance.debugEventsEnabled = true;
  setupServiceLocator();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const Sudani());
}
