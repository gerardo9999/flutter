import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/pages/HomePage.dart';
import 'package:software2/providers/UsuarioProvider.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context) => UsuarioProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        // routes: builderAppRoutes(),
      ),
    );
  }
}