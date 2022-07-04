import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculateur IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  // Form values
  double? resultat;
  double imc = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text(
          'IMC Calculator',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView (
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          const SizedBox(height: 10,),
          const Text('Poids : ',
            textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.redAccent
          ),),
          TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              //fillColor: Colors.blueAccent,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),),
          const SizedBox(height: 15,),
          const Text('Taille : ', textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent
              )),
          TextField(
            controller: controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              //fillColor: Colors.blueAccent,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),),
          const SizedBox(height: 15,),
          OutlinedButton(
            onPressed: () {
              if(controller1.text != '' && controller2.text != ''){
                double poids = double.parse(controller1.text);
                double taille = double.parse(controller2.text);
                imc = poids / (taille * taille);
                setState((){});
                print('IMC = $imc');
              }
            },
            child: const Text("CALCULER IMC"),
          ),
          const SizedBox(height: 15,),
          OutlinedButton(
            onPressed: () {
              controller1.text = '';
              controller2.text = '';
              imc = 0;
              setState((){});
            },
            child: Text("RAZ"),
          ),
          const SizedBox(height: 15,),
          imc == 0 ? Text('Vous devez cliquer sur le bouton CALCULER IMC pour obtenir  votre résultat') : Text('Votre résulltat  : $imc'),
        ],
      )

    );
  }
}
