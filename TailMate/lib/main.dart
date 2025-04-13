import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/screens/splash_screen.dart';
import 'package:tailmate/theme/app_theme.dart';
import 'package:tailmate/providers/theme_provider.dart';
import 'package:tailmate/providers/pet_provider.dart';
import 'package:tailmate/providers/service_provider.dart';
import 'package:tailmate/providers/chat_provider.dart';
import 'package:tailmate/providers/user_provider.dart';
import 'package:tailmate/screens/chat_screen.dart';
import 'package:tailmate/screens/home_screen.dart';
import 'package:tailmate/screens/auth/login_screen.dart';
import 'package:tailmate/screens/pet_detail_screen.dart';
import 'package:tailmate/screens/pet_list_screen.dart';
import 'package:tailmate/screens/profile_screen.dart';
import 'package:tailmate/screens/auth/register_screen.dart';
import 'package:tailmate/screens/service_details_screen.dart';
import 'package:tailmate/screens/service_provider_details.dart';
import 'package:tailmate/screens/service_providers_screen.dart';
import 'package:tailmate/screens/services_tab.dart';
import 'package:tailmate/screens/settings_screen.dart';
import 'package:tailmate/screens/onboarding_screen.dart';
import 'package:tailmate/models/service_provider_model.dart';
import 'package:tailmate/screens/chat_history_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => PetProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const TailMateApp(),
    ),
  );
}

class TailMateApp extends StatelessWidget {
  const TailMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'TailMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const SplashScreen(),
      routes: {
        '/chat': (context) => ChatScreen(
              provider: ModalRoute.of(context)!.settings.arguments
                  as ServiceProviderModel,
            ),
        '/chat-history': (context) => const ChatHistoryScreen(),
      },
    );
  }
} 