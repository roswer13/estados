import 'package:estado/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  bool get existeUsuario => _usuario != null;

  set usuario(Usuario? user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    if (_usuario == null) return;

    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    if (_usuario == null) return;

    _usuario!.profesiones!
        .add('Profesion: ${_usuario!.profesiones!.length + 1}');

    notifyListeners();
  }
}
