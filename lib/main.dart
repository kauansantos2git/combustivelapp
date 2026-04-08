import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CombustivelApp(),
));

class CombustivelApp extends StatefulWidget{
  @override
  _CombustivelAppState createState() => _CombustivelAppState();
}

class _CombustivelAppState extends State<CombustivelApp>{
  final TextEditingController _etanolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  
  String _resultado = "";

static const Color corFundo = Color(0xFFFFF3CD);       // amarelo suave, mas ainda visível
static const Color corCard = Color(0xFFFFFFFF);        // branco
static const Color corPrimaria = Color(0xFFFFC107);    // amarelo principal (mais vivo)
static const Color corSecundaria = Color(0xFF43A047);  // verde médio moderno
static const Color corTexto = Color(0xFF263238);       // cinza escuro
static const Color corTextoCinza = Color(0xFF78909C);  // cinza equilibrado
static const Color corBorda = Color(0xFFBDBDBD);       // borda um pouco mais visível

  void _calcular(){
    final double etanol = double.tryParse(_etanolController.text)?? 0.0;
    final double gasolina = double.tryParse(_gasolinaController.text)?? 0.0;
    final double coef = etanol/gasolina;
    final coefString = coef <= 7 ? "Etanol" : "Gasolina";

    if (etanol < 0 && gasolina < 0){
      setState(() {
        _resultado = "Informe o valor dos Combustíveis";
      });
      return;
    }
    setState(() {
      _resultado = 'Compensa mais abastecer com $coefString.';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //LOCAL ONDE FICARÃO A MAIORIA DOS NOSSOS ELEMENTOS
        backgroundColor: corFundo,
        //semelhante ao header
        appBar: AppBar(
          backgroundColor: corCard,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "⛽Escolha turbo",
            style: TextStyle(
              color: corSecundaria,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2
            )),
        ),

        body: SingleChildScrollView(
          padding:EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16,),
              //AQUI É ONDE ESTARÃO NOSSOS ELEMENTOS/WIDGETS
              
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: corCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: corBorda, width: 1),
                ),
                child: Text(
                "Informe os valores:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: corTextoCinza,
                  height: 1.5,
                  ),
                ),
              ),

              SizedBox(height: 28),
              _buildCampo(
                controller: _etanolController,
                label: 'Valor do Etanol',
              ),
              SizedBox(height: 16),
               _buildCampo(
                controller: _gasolinaController,
                label: 'Valor do Combustível',
              ),
              SizedBox(height: 16,),

              ElevatedButton(
                onPressed: _calcular,
                style: ElevatedButton.styleFrom(
                  backgroundColor: corPrimaria,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                  elevation: 6,
                  shadowColor: corPrimaria.withOpacity(0.5),
                ),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                )
              ),
              SizedBox(height: 36),
              
              if(_resultado.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: corCard, 
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: corPrimaria,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: corPrimaria.withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 4)
                      ),
                    ]
                  ),

                  child: Column( children: [
                    Text(
                      'O resultado é:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: corPrimaria,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 2.0,
                        color: corTexto,
                      ),
                    ),
                  ],),
                ),
                SizedBox(height: 16),
                Text(
                  'Calcule qual tipo de combustível compensa mais para abastecer.',
                  style: TextStyle(fontSize: 12, color: corTextoCinza),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
    );
  }
  Widget _buildCampo({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: corTexto, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: corTextoCinza),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: corBorda, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: corPrimaria, width:2),
        ),
        filled: true,
        fillColor: corCard,
      ),
    );
}
}