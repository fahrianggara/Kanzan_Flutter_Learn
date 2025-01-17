import 'package:belajar_1/data/sources/local/user_local_source_impl.dart';
import 'package:belajar_1/di/injections.dart';
import 'package:belajar_1/presentation/bloc/login/login_logout_bloc.dart';
import 'package:belajar_1/presentation/pages/home/beranda.dart';
import 'package:belajar_1/presentation/pages/login/pages/login.dart';
import 'package:belajar_1/single_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserLocalSourceImpl().getToken();
  if (kDebugMode) print(token);
  BlocOverrides.runZoned(
    () => runApp(MyApp(token: token)),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginLogoutBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: token == null ? const Login() : const Beranda(),
      ),
    );
  }
}
