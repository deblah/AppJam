import 'package:flutter/material.dart';

const List<String> optionsSalario = <String>['Abaixo de 2 salários mínimos', 'Abaixo de 1 salários mínimos', 'Mais de 2 salários mínimos'];
const List<String> optionsFilhos = <String>['Até 2 filhos', 'Mais de 3 filhos', 'Meus filhos não estão vacinados/ na escola'];
const List<String> optionsChefe = <String>['Sim', 'Não'];

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Abaixo de 2 salários mínimos"),value: "Abaixo de 2 salários mínimos"),
    DropdownMenuItem(child: Text("Abaixo de 1 salários mínimos"),value: "Abaixo de 1 salários mínimos"),
    DropdownMenuItem(child: Text("Mais de 2 salários mínimos"),value: "Mais de 2 salários mínimos"),
  ];
  return menuItems;
}
List<DropdownMenuItem<String>> get dropdownItems1{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Até 2 filhos"),value: "Até 2 filhos"),
    DropdownMenuItem(child: Text("Mais de 3 filhos"),value: "Mais de 3 filhos"),
    DropdownMenuItem(child: Text("Meus filhos não estão vacinados/ na escola"),value: "Meus filhos não estão vacinados/ na escola"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems2{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Sim"),value: "Sim"),
    DropdownMenuItem(child: Text("Não"),value: "Não"),
  ];
  return menuItems;
}

void main(){
  runApp(MaterialApp(home: Home(),));
}
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController auxilioController = TextEditingController () ;
  String _infoText = "Informe seus dados";
  String? selectedValue = null;
  String? selectedValue1 = null;
  String? selectedValue2 = null;

  void _resetFields(){

    _formKey = GlobalKey<FormState>();
    auxilioController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });

  }
  void  _calculate(){

    int auxilioTotal = 0;

    setState(() {
      switch(selectedValue){
        case "Abaixo de 2 salários mínimos":
          if(selectedValue1 == "Até 2 filhos"){
            auxilioTotal = 1818;
            _infoText = "Você recebe RS 1818.00 ";
          }
          else if(selectedValue1 == "Mais de 3 filhos"){
            auxilioTotal = 3636;
            _infoText = "Você recebe RS 3636.00";
          }
          else if(selectedValue1 == "Meus filhos não estão vacinados/ na escola"){
            _infoText = "Você não recebe";
            selectedValue2 = "Não";
          }
          if(selectedValue2 == "Sim"){
            auxilioTotal += 600;
            _infoText += " + RS 600.00 ";
          }
          break;
        case "Abaixo de 1 salários mínimos":
          if(selectedValue1 == "Até 2 filhos"){
            auxilioTotal = 3030;
            _infoText = "Você recebe RS 3030.00 ";
          }
          else if(selectedValue1 == "Mais de 3 filhos"){
            auxilioTotal = 3636;
            _infoText = "Você recebe RS 3636.00";
          }
          else if(selectedValue1 == "Meus filhos não estão vacinados/ na escola"){
            _infoText = "Você não recebe";
            selectedValue2 = "Não";
          }
          if(selectedValue2 == "Sim"){
            auxilioTotal += 600;
            _infoText += " + RS 600.00 ";
          }
          break;
        case "Mais de 2 salários mínimos":
          _infoText = "Você não recebe";
          break;
        default:
      }
    });




  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Auxílio"),centerTitle: true,
        backgroundColor: Colors.blue,

        actions: <Widget>[
          IconButton(
              onPressed: _resetFields,
              icon: Icon(Icons.refresh)
          ),


        ],),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.monetization_on_outlined, size: 120.0, color: Colors.lightBlueAccent,),
              Text("Você pode receber o auxílio?",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),),
              Text("Renda Familiar: ",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.blue,
                  ),
                  validator: (value) => value == null ? "Select a country" : null,
                  dropdownColor: Colors.blue,
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems),
              Text("Quantidade filhos VACINADOS e na ESCOLA",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.lightBlue,
                  ),
                  validator: (value) => value == null ? "Select " : null,
                  dropdownColor: Colors.lightBlue,
                  value: selectedValue1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue1 = newValue!;
                    });
                  },
                  items: dropdownItems1),
              Text("Chefe de família é mãe solo?",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.lightBlue,
                  ),
                  validator: (value) => value == null ? "Select " : null,
                  dropdownColor: Colors.lightBlue,
                  value: selectedValue2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue2 = newValue!;
                    });
                  },
                  items: dropdownItems2),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    _calculate();
                },
                child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue, foregroundColor: Colors.lightBlue ),
              ),
              Text(
                "$_infoText",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontSize: 25.0),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

