import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/validadores.dart';
import 'package:cpf_cnpj_validator/cnpj_validator.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final TextEditingController _nomeController = TextEditingController(text: "");
  final TextEditingController _idadeController = TextEditingController(text: "");
  final TextEditingController _cpfController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";
  String? _nome;
  String? _idade;
  String? _cpf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _nomeController,
                onSaved: (valor){
                  _nome = valor;
                },
                decoration: const InputDecoration(
                  hintText: "Digite seu nome",
                ),
                validator: (valor) {

                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                      .minLength(5, msg: "Mínimo de 5 caracteres")
                      .maxLength(100, msg: "Máximo de 5 caracteres")
                      .valido(valor);
                  
                },
              ),

              TextFormField(
                controller: _idadeController,
                onSaved: (valor){
                  _idade = valor;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Digite sua idade",
                ),
                validator: (valor) {

                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                      .valido(valor);
                },
              ),

              TextFormField(
                controller: _cpfController,
                onSaved: (valor){
                  _cpf = valor;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                decoration: const InputDecoration(
                  hintText: "Digite seu CPF",
                ),
                validator: (valor) {

                  // if (valor!.isEmpty) {
                  //   return "O campo é obrigatório";
                  // }

                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: "Campo obrigatório")
                      .add(Validar.CPF, msg: "CPF Inválido")
                  .valido(valor);

                  // if(valor!.isEmpty){
                  //   return "Campo obrigatório";
                  // }
                  //
                  // if(!CPFValidator.isValid(valor)){
                  //   return "CPF Inválido";
                  // }

                },
              ),

              ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){

                      _formKey.currentState!.save();

                      setState(() {
                        // _nome = _nomeController.text;
                        // _idade = _idadeController.text;
                        // _cpf = _cpfController.text;
                        _mensagem = "Nome $_nome idade: $_idade CPF: $_cpf";

                      });
                    }
                  },
                  child: const Text("Salvar")),
              Text(
                _mensagem,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
