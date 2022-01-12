import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _moedaController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mascaras e validações"),),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            //CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              decoration: const InputDecoration(
                hintText: "Digite CPF"
              ),
            ),

            //CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "Digite CNPJ"
              ),
            ),

            //CEP
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "Digite CEP"
              ),
            ),

            //TELEFONE
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "Digite TELEFONE"
              ),
            ),

            //DATA
            TextField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
              decoration: const InputDecoration(
                  hintText: "Digite DATA"
              ),
            ),

            //MOEDA
            TextField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(
                  centavos: true
                )
              ],
              decoration: const InputDecoration(
                  hintText: "Digite Moeda"
              ),
            ),


            ElevatedButton(
                onPressed: (){
                  setState(() {
                    //_valorRecuperado = _cpfController.text.toString();
                    //_valorRecuperado = _cnpjController.text.toString();
                    //_valorRecuperado = _cepController.text.toString();
                    //_valorRecuperado = _telefoneController.text.toString();
                    //_valorRecuperado = _dataController.text.toString();
                    //_valorRecuperado = _moedaController.text.toString();

                    // String moedaBD = _moedaController.text.toString();
                    // moedaBD = moedaBD.replaceAll(".", "");
                    // moedaBD = moedaBD.replaceAll(",", ".");
                    //
                    // double valorDouble = double.parse(moedaBD);
                    //
                    // var formatador = NumberFormat("#,##0.00", "pt_BR");
                    // var resultado = formatador.format(valorDouble);

                    //_valorRecuperado = "BD: $moedaBD / Exibição: $resultado";

                    //for(var item in Estados.listaEstados){
                    //for(var item in Meses.listaMeses){
                    for(var item in Semana.listaDiasSemana){
                      print("item: $item");
                    }

                  });
                },
                child: const Text("Recuperar Valor")),
            Text("Valor: $_valorRecuperado",
              style: const TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
