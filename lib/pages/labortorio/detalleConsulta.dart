import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:software2/pages/pdf/PDFconsulta.dart';

class DetalleConsulta extends StatefulWidget {
  
  final userAth;
  final idPaciente;
  final nombre;
  final apellidos;
  final telefono;
  final direccion;
  final email;
  final carnet;

  final fecha;
  final precio;
  final tipo;


  DetalleConsulta({
    this.userAth,
    
    this.idPaciente,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.direccion,
    this.email,
    this.carnet,
    this.fecha,
    this.precio,
    this.tipo
  });

  @override
  _DetalleConsultaState createState() => _DetalleConsultaState();
}

class _DetalleConsultaState extends State<DetalleConsulta> {
  
  
  
  final pdf = pw.Document();

  generarPDF(){
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,

    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detalle Consultas",
        style: TextStyle(fontSize: 16),
        ),
      ),
      body: 
         SingleChildScrollView(
                    child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(10),
            elevation: 10,

      // Dentro de esta propiedad usamos ClipRRect
        child: ClipRRect(

            // Los bordes del contenido del card se cortan usando BorderRadius
            borderRadius: BorderRadius.circular(20),

            // EL widget hijo que será recortado segun la propiedad anterior
            child: Column(

              children: <Widget>[

                // Usamos el widget Image para mostrar una imagen
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 3.0, color: Colors.blueAccent)
                    )
                  ),
                  child: Image.asset(
                    'assets/images/medica.png',
                    width: double.infinity,
                    height: 150,

                  ),
                ),

                // Usamos Container para el contenedor de la descripción
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                        
                          border: Border(
                            top    : BorderSide(width: 2.0,color: Colors.blue),
                            right  : BorderSide(width: 2.0,color: Colors.blue),
                            bottom : BorderSide(width: 2.0,color: Colors.blue),
                            left   : BorderSide(width: 2.0,color: Colors.blue),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          )
                        ),

                        
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                               Row(
                                  children: [
                                    Text("Paciente : ",style: TextStyle( fontWeight: FontWeight.w800 )),
                                    Text(widget.nombre +  " " + widget.apellidos)
                                  ],
                                ),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("CI : " ,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800
                                        ),
                                        ),
                                        Text(widget.carnet),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Telefono : ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800
                                          ),
                                        ),
                                        Text(widget.telefono)
                                      ],
                                    ),

                                   
                                  ],
                                ),
                               Row(
                                  children: [
                                    Text("Direccion : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    Text(widget.direccion)
                                  ],
                                ),
                               Row(
                                  children: [
                                    Text("Email : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800
                                      ),
                                    ),
                                    Text(widget.email)
                                  ],
                                ),
                               
                               Card(
                                
                                child : Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                  
                                    border: Border(
                                      top    : BorderSide(width: 2.0,color: Colors.blue),
                                      right  : BorderSide(width: 2.0,color: Colors.blue),
                                      bottom : BorderSide(width: 2.0,color: Colors.blue),
                                      left   : BorderSide(width: 2.0,color: Colors.blue),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                    )
                                  ),
                                )
                               ),


                              Card(
                                
                                child : Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                  
                                    border: Border(
                                      top    : BorderSide(width: 2.0,color: Colors.blue),
                                      right  : BorderSide(width: 2.0,color: Colors.blue),
                                      bottom : BorderSide(width: 2.0,color: Colors.blue),
                                      left   : BorderSide(width: 2.0,color: Colors.blue),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                    )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Fecha  : ",
                                              style: TextStyle(fontWeight: FontWeight.w800),  
                                            ),
                                            Text(
                                              DateFormat.yMMMd().add_jm().format(DateTime.parse(widget.fecha.toDate().toString())) 
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("EXAMEN MEDICO")
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(widget.tipo)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                )
                              ),

                                                    
                              Card(
                                child : Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                  
                                    border: Border(
                                      top    : BorderSide(width: 2.0,color: Colors.blue),
                                      right  : BorderSide(width: 2.0,color: Colors.blue),
                                      bottom : BorderSide(width: 2.0,color: Colors.blue),
                                      left   : BorderSide(width: 2.0,color: Colors.blue),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                    )
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Precio : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800
                                              ),
                                            ),
                                            Text(
                                              widget.precio.toString()
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  
                                )
                              ),







                            ],
                          ),
                        ),
                      )
                      
                    ],
                  ),
                ),
              ],
            ),
        )
      ),
         ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => PDFConsulta(
          userAth:widget.userAth,
          idPaciente:widget.idPaciente,
          nombre:widget.nombre,
          apellidos:widget.apellidos,
          telefono:widget.telefono,
          direccion:widget.direccion,
          email:widget.email,
          carnet:widget.carnet,
          fecha:widget.fecha,
          precio:widget.precio,
          tipo : widget.tipo
          )));

        },
        child: Icon(Icons.save),
      ),
    );
  }
}