import 'package:estado/models/usuario.dart';
import 'package:estado/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: usuarioService.existeUsuario
            ? Text('Nomrbre: ${usuarioService.usuario?.nombre}')
            : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioService.usuario = Usuario(
                  nombre: 'Roswer',
                  edad: 30,
                  profesiones: ['Fullstack develepoer', 'Gamer'],
                );
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(25);
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.agregarProfesion();
              },
              child: const Text(
                'Añadir profesion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
