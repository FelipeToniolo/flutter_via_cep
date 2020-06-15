import 'package:flutter/material.dart';
import 'package:flutter_via_cep/flutter_via_cep.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<ViaCepModel>(
          future: ViaCepModel.getCep("01001000"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Cep invalido, Error: ${snapshot.error}');
                else
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Logradouro: ${snapshot.data.logradouro}'),
                        Text('Complemento: ${snapshot.data.complemento}'),
                        Text('Bairro: ${snapshot.data.bairro}'),
                        Text('Localidade: ${snapshot.data.localidade}'),
                        Text('UF: ${snapshot.data.uf}'),
                        Text('Unidade: ${snapshot.data.unidade}'),
                        Text('Ibge: ${snapshot.data.ibge}'),
                        Text('Gia: ${snapshot.data.gia}'),
                      ],
                    ),
                  );
            }
          },
        ),
      ),
    );
  }
}
