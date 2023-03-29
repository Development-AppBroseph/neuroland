import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_cubit.dart';
import 'package:grow_food/rout_generatoe.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'injection.container.dart' as di;
import 'injection.container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => sl<SignUpCubit>(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => sl<SignInCubit>(),
        ),
        BlocProvider<RootScreenCubit>(
          create: (context) => sl<RootScreenCubit>(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    ),
  );
}
