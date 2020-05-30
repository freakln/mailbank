import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mailbank/data.dart';
import 'package:regexed_validator/regexed_validator.dart';

class RegistrationApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationAppState();
  }
}

class _RegistrationAppState extends State<RegistrationApp> {
  double pos=0;
  final pageIndexNotifier = ValueNotifier<int>(0);
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fContatcKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
  GlobalKey<FormFieldState>();
  var _cpfController = new MaskedTextController(mask: '000.000.000-00');
  var _telController = new MaskedTextController(mask: '(00)00000-0000');
  var _cepController = new MaskedTextController(mask: '00000-000');
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  PageController controller;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
           inputDecorationTheme: InputDecorationTheme(
              focusColor: Colors.white,
              filled: true,
              labelStyle: new TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
              ),
              border: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.red, width: 2.0)
              )),
        ),
       home: Scaffold(
         backgroundColor: Color(0xff33333c),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              padding: const EdgeInsets.only(top: 15 ),
              children: <Widget>[
                Center(
                  child: DotsIndicator(dotsCount: 3,
                    position: pos,
                    decorator: DotsDecorator(
                      size: const Size.square(30.0),
                      activeSize: const Size(30.0, 30.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      spacing: const EdgeInsets.all(10.0),
                      color: Color(0xff1eb980)
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.63,
                  child: PageView(
                    controller: controller,
                    physics: new NeverScrollableScrollPhysics(),
                    onPageChanged: _onPageViewChange,
                    children: <Widget>[
                      registerForm(),
                      contactForm(),
                      loginForm()


                    ],

                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.15,vertical: 30 ),
                    // specific value
                    child: FlatButton(
                      color: Color(0xff1eb980),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,

                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 400), curve: Curves.linear);
                      },
                      child: Text(
                        pos<2?'PRÓXIMO':'ENVIAR',
                        style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.w700),
                      ),
                    )
                )


              ],
            ),
          ),
          ),
        ),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      pos = page.toDouble();
    });
  }

  Widget registerForm(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(color: Colors.blueGrey,
      borderRadius:  BorderRadius.all(Radius.circular(5))),
      width:MediaQuery.of(context).size.width  ,
      child: Column(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,

            child: Text('Cadastro',
              textAlign:TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FormBuilder(
            // context,
            key: _fContatcKey,
            // autovalidate: true,
            readOnly: false,
            child: Column(
                children: <Widget>[

                  FormBuilderTextField(
                    attribute: "nome",
                    decoration:InputDecoration(labelText: "Nome"),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio")
                    ],
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderDateTimePicker(
                    attribute: "nascimento",
                    inputType: InputType.date,

                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration:InputDecoration(labelText: "Nascimento"),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio")
                    ],
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "cpfNum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                    ],
                    decoration: InputDecoration(labelText:'CPF'),
                    controller: _cpfController,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(10),
                      FormBuilderValidators.minLength(11),
                      FormBuilderValidators.maxLength(11),
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "rgNum",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration:InputDecoration(labelText: "RG"),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio")
                    ],
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderPhoneField(
                    attribute: 'telNum',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration:InputDecoration(labelText: "Telefone"),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio")
                    ],
                    controller: _telController,


                  )


                ]
            ),
          ),
        ],
      ),
    );
  }
  Widget contactForm(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(color: Colors.blueGrey,
      borderRadius:  BorderRadius.all(Radius.circular(5))),
      width:MediaQuery.of(context).size.width  ,
      child: Column(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,

            child: Text('Contato',
              textAlign:TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FormBuilder(
            // context,
            key: _specifyTextFieldKey,
            // autovalidate: true,
            readOnly: false,
            child: Column(
                children: <Widget>[

                  FormBuilderTextField(
                    attribute: "cepNum",
                    decoration:InputDecoration(labelText: "CEP"),
                    controller: _cepController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio"),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.minLength(9),
                    ],
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTypeAhead(
                    textFieldConfiguration: TextFieldConfiguration(style:TextStyle(
                      color: Colors.white,
                    ), ),
                    decoration: InputDecoration(
                      labelText: "Estado",

                    ),
                    attribute: 'estado',

                    itemBuilder: (context, estado) {
                      return ListTile(

                        title: Text(estado,),
                      );
                    },
                    controller: TextEditingController(text: ''),
                    suggestionsCallback: (query) {
                      if (query.isNotEmpty) {
                        var lowercaseQuery = query.toLowerCase();
                        return allEstados.where((country) {
                          return country.toLowerCase().contains(lowercaseQuery);
                        }).toList(growable: false)
                          ..sort((a, b) => a
                              .toLowerCase()
                              .indexOf(lowercaseQuery)
                              .compareTo(
                              b.toLowerCase().indexOf(lowercaseQuery)));
                      } else {
                        return allEstados;
                      }
                    },
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "cidadeNome",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                    ],
                    decoration: InputDecoration(labelText:'Cidade'),
                    controller: _cpfController,
                    validators: [
                      FormBuilderValidators.required(),
                    ],

                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "bairroNome",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration:InputDecoration(labelText: "Bairro"),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio")
                    ],
                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "ruaNome",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(14),
                    ],
                    decoration: InputDecoration(labelText:'Rua'),
                    controller: _cpfController,
                    validators: [
                      FormBuilderValidators.required(),
                    ],

                  ),



                ]
            ),
          ),
        ],
      ),
    );
  }
  Widget loginForm(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      decoration: BoxDecoration(color: Colors.blueGrey,
      borderRadius:  BorderRadius.all(Radius.circular(5))),
      width:MediaQuery.of(context).size.width  ,
      child: Column(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,

            child: Text('Credenciais de acesso',
              textAlign:TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FormBuilder(
            // context,
            key: _specifyTextFieldKey,
            // autovalidate: true,
            readOnly: false,
            child: Column(
                children: <Widget>[



                  FormBuilderTextField(
                    attribute: "email",
                    decoration:InputDecoration(labelText: "E-mail"),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],

                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validators: [
                      FormBuilderValidators.required(errorText: "O campo não pode ser vazio"),
                      FormBuilderValidators.email(errorText:"Inserir E-mail válido"),
                    ],
                  ),

                  SizedBox(
                    height:20 ,
                  ),

                  FormBuilderTextField(
                    attribute: "senha",
                    controller: _pass,
                    maxLines: 1,
                    obscureText: true,

                    style: TextStyle(
                      color: Colors.white,
                    ),

                    decoration: InputDecoration(labelText:'Senha'),

                    validators: [
                      FormBuilderValidators.required(),
                      (val){
                        if(!validator.password(val)){
                          return 'Senha invalida';
                        }
                        return null;
                      }
                     ],

                  ),
                  SizedBox(
                    height:20 ,
                  ),
                  FormBuilderTextField(
                    attribute: "senhaConfirmacao",
                    controller: _confirmPass,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(labelText:'Confirmar Senha'),
                    validators: [
                      FormBuilderValidators.required(),
                          (val){
                        if(val.isEmpty)
                          return 'Empty';
                        if(val != _pass.text)
                          return 'Not Match';
                        return null;
                      },
                          (val){
                        if(!validator.password(val)){
                          return 'Senha invalida';
                        }
                        return null;
                      }
                    ],

                  ),



                ]
            ),
          ),
        ],
      ),
    );
  }


}
