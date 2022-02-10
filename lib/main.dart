import 'package:estado/pages/pagina1_page.dart';
import 'package:estado/pages/pagina2_page.dart';
import 'package:estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsuarioService()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => const Pagina1Page(),
        'pagina2': (_) => const Pagina2Page(),
      },
    );
  }
}
