import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PDFConsulta extends StatefulWidget {
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
  
  PDFConsulta({
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
  _PDFConsultaState createState() => _PDFConsultaState();
}

class _PDFConsultaState extends State<PDFConsulta> {

  pw.Document pdf;
  PdfImage imagen;
  PdfImage _logo;
  Uint8List archivoPdf;



  @override
  void initState() {
    initPDF();
    super.initState();

  }

  Future<void> initPDF() async {
    archivoPdf = await generarPdf1();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Consulta",
              style: TextStyle(fontSize: 16),      
              ),),
      body:  
        SafeArea(
          child: SingleChildScrollView(
            child : Column(
              children: <Widget>[
                Container(
                  height: 500,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 25,
                    ),
                    child: PdfPreview(
                      build: (format) => archivoPdf,
                      useActions: true,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          archivoPdf = await generarPdf1();
                          setState(
                            () {
                              // iconoSeleccionado(1);
                              archivoPdf = archivoPdf;
                            },
                          );
                        },
                        child: Icon(
                          Icons.picture_as_pdf,
                          // size: sizeIcon1,
                          color: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Printing.sharePdf(
                              bytes: archivoPdf, filename: 'Documento.pdf');
                        },
                        child: Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                
              ],
            )
          )
        )
      ,
      );
    

    

  }
    Future<Uint8List> generarPdf1() async {
    pdf = pw.Document();

    // imagen = PdfImage.fil;

    imagen = PdfImage.file(
      pdf.document,
      bytes: (await rootBundle.load('assets/images/medica.png')).buffer.asUint8List(),
    );

    this._logo = PdfImage.file(
      pdf.document,
      bytes: (await rootBundle.load('assets/images/medica.png')).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.zero,
        build: (context) => [
          pw.Container(
            child : pw.Center(
              child : pw.Padding(
                padding: pw.EdgeInsets.symmetric(vertical: 20),
                child: pw.Center(
                  child: pw.Text(
                    'Examen Medico',
                    style: pw.TextStyle(
                      fontSize: 20,
                      color: PdfColors.blue,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              
              
              
            ],
          ),
          pw.SizedBox(
            height: 20,
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: 

              pw.Container(
               
                child : pw.Column(

                children: [
                  // pw.Image(),
                  pw.Row(children: [
                    pw.Text("Paciente :",
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    pw.Text(widget.nombre,
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    pw.Text(" "),
                    pw.Text(widget.apellidos,
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                  ]),

                  pw.Row(children: [
                    pw.Text("CI :",
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    pw.Text(widget.carnet,
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    
                  ]),



                  pw.Row(children: [
                    pw.Text("Telefono :",
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    pw.Text(widget.telefono,
                      style: pw.TextStyle(
                        fontSize: 15,
                        // color: PdfColors.blue,
                      ),
                    ),
                    
                  ]),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Center(
                    child: 
                      pw.Container(
                        height: 100,
                        width: double.infinity,
                        color: PdfColors.blueGrey100,
                        child: pw.Column( 
                          children : [
                            pw.SizedBox(
                              height: 10,
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  "Fecha : "
                                ),
                                pw.Text(
                                  DateFormat.yMMMd().add_jm().format(DateTime.parse(widget.fecha.toDate().toString()))
                                )
                              ]
                            ),
                            pw.SizedBox(
                              height: 5,
                            ),
                            pw.Center(
                              child: 
                              pw.Column(
                                children: [
                                  pw.Text("Examen Medico"),
                                  pw.Text(widget.tipo)
                                ]
                              )  
                            ),
                            pw.SizedBox(
                              height: 20,
                            ),
                            pw.Row(
                              children : [
                                pw.Text("Precio : "),
                                pw.Text(widget.precio.toString()),
                                pw.Text("  Bs"),
                              ]
                            )
                          ]
                        )
                      )
                  ),
                  
                  


                ])
              ),           
            // pw.Text(
            //   widget.nombre,
            //   style: pw.TextStyle(
            //     fontSize: 20,
            //   ),
            //   textAlign: pw.TextAlign.justify,
            // ),
          ),
          pw.SizedBox(
            height: 70,
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              
            ],
          ),
        ],
      ),
    );
    return pdf.save();
  }

}