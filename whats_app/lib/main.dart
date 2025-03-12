import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whats_app/constatnts.dart';
import 'package:whats_app/core/utils/app_route.dart';
import 'package:whats_app/feature/chat/presentation/manager/chat_cubit.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode, builder: (context) => 
      const WhatsApp()
      // )
      );
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => ChatCubit(),
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
      ),
    );
  }
}
