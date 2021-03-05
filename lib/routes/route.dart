import 'package:flutter/cupertino.dart';
import 'package:software2/pages/home/Administrador.dart';
import 'package:software2/pages/home/Medico.dart';



Map<String, WidgetBuilder> builderAppRoutes(){
  return {
        AdministradorHome.route    :(_) => AdministradorHome(),
        MedicoHome.route    :(_) => MedicoHome(),
        // PacienteHome.route    :(_) => PacienteHome()
  };

  
}

