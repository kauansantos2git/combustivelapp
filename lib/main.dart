import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CombustivelApp(),
));

class CombustivelApp extends StatelessWidget{
  
  String _resultado = "";
  void _calcular(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Calculadora de combustível"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            Text(
              "Bem-vindo à calculadora de combustível ⛽",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 36),

            Text(
              "Digite o preço da gasolina e do etanol:",
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 16),

            // Mulheres
            TextField(
              decoration: InputDecoration(
                labelText: "Informe o preço da gasolina:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // Homens
            TextField(
              decoration: InputDecoration(
                labelText: "Informe o preço do etanol:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 36,),
            
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],  
        ),
      ),

    );
  }
}