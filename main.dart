import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultIMC = "";

  void calcmasc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    setState(() {
      resultIMC = "Seu IMC é = ${imc.toStringAsPrecision(4)}\n";
      if (imc < 20)
        resultIMC += "Voce está abaixo do peso";
      else if (imc >= 20 && imc <= 24.9)
        resultIMC += "Voce está no seu peso ideal";
      else if (imc >= 25 && imc <= 29.9)
        resultIMC += "Voce está com obesidade leve";
      else if (imc >= 30 && imc <= 39.9)
        resultIMC += "Voce com obesidade moderada";
      else if (imc >= 40)
        resultIMC += "Voce está com obesidade morbita";
    });
  }

  void calcfem() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    setState(() {
      resultIMC = "Seu IMC é = ${imc.toStringAsPrecision(4)}\n";
      if (imc < 19)
        resultIMC += "Voce está abaixo do peso";
      else if (imc >= 19 && imc <= 23.9)
        resultIMC += "Voce está no seu peso ideal";
      else if (imc >= 24 && imc <= 28.9)
        resultIMC += "Voce está com obesidade leve";
      else if (imc >= 29 && imc <= 38.9)
        resultIMC += "Voce com obesidade moderada";
      else if (imc >= 39)
        resultIMC += "Voce está com obesidade morbita";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculdora de IMC'
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: alturaController,
                decoration: const InputDecoration(
                  labelText: 'Sua altura:',
                  hintText: 'Informe sua altura (m)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                  controller: pesoController,
                  decoration: const InputDecoration(
                    labelText: 'Seu peso:',
                    hintText: 'Informe seu peso (kg)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )
                ),
              ),
              const SizedBox(height: 18),
              const Center(
                  child: Text('Calcule seu IMC de acordo ao seu sexo:')
              ),
              const SizedBox(height: 16),
              Container(
                width: 200,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        calcmasc();
                      },
                      icon: const Icon(Icons.man),
                      label: Text('Masculino'))
              ),
              const SizedBox(height: 16),
              Container(
                  width: 200,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        calcfem();
                      },
                      icon: const Icon(Icons.woman),
                      label: Text('Feminino'))
              ),
              const SizedBox(height: 22),
              Text(resultIMC, style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          resultIMC = "";
        },
        tooltip: 'Increment',
        child: Text('Limpar')
      ),
    );
  }
}
