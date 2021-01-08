import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:market/models/urun_model.dart';
import 'package:market/ui/BarkodScan.dart';
import 'package:provider/provider.dart';

class NewUrun extends StatefulWidget {

  @override
  _NewUrunState createState() => _NewUrunState();
}

class _NewUrunState extends State<NewUrun> {
  String _scanBarcode = 'Unknown';
  TextEditingController _barkod = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _payment = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
              title: Text("Urun Kayit"),),
          body: Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                        child:TextFormField(
                            controller: _barkod,
                            decoration: InputDecoration(
                              icon:Container(
                                child:IconButton(
                                  icon: Icon(
                                      Icons.camera_alt_outlined
                                  ),
                                  onPressed: () => scanBarcodeNormal(),
                                ),
                              ),
                                labelText: "Barkod",
                                border: OutlineInputBorder(
                                ),

                            ),
                            //validator: _nameValidator,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null) {
                                return null;
                              } else {
                                debugPrint("hata var");
                                return "hata";
                              }
                            }),

                      ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                    child:TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: "İsim",
                          border: OutlineInputBorder(
                          ),

                        ),
                        //validator: _nameValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null) {
                            return null;
                          } else {
                            debugPrint("hata var");
                            return "hata";
                          }
                        }),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                    child:TextFormField(
                      keyboardType: TextInputType.number,
                        controller: _payment,
                        decoration: InputDecoration(
                          labelText: "Fiyat",
                          border: OutlineInputBorder(
                          ),
                        ),
                        //validator: _nameValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null) {
                            return null;
                          } else {
                            debugPrint("hata var");
                            return "hata";
                          }
                        }),

                  ),


                  RaisedButton(
                      onPressed: continueButton,
                      color: Colors.blueAccent,
                      child: Text("Ekle",style: TextStyle(color: Colors.white),)),
                ],

              ),
            );
          },
          )
          ,
        )
    );
  }
  continueButton(){
    final _urunModel = Provider.of<UrunModel>(context,listen: false);
    _urunModel.createUrun(
      barkod: _barkod.text!=null ? _barkod.text : _scanBarcode,
      name: _name.text,
      payment: double.parse(_payment.text),
    );
  }
}

