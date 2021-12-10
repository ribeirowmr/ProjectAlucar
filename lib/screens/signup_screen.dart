import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_alucar/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final addressController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(child: CircularProgressIndicator(),);
          return Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Nome Completo"
                  ),
                  validator: (text) {
                    if (text!.isEmpty) return "Nome Inválido!";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "E-mail"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty || !text.contains("@"))
                      return "E-mail Inválido!";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Senha"
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isEmpty || text.length < 6)
                      return "Senha Inválida!";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      hintText: "Endereço"
                  ),
                  validator: (text) {
                    if (text!.isEmpty) return "Endereço Inválido!";
                  },
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(

                      child: Text("Criar Conta",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Map<String, dynamic> userData = {
                            "name": nameController.text,
                            "email": emailController.text,
                            "address": addressController.text
                          };
                          model.signUp(
                              userData: userData,
                              pass: passController.text,
                              onSuccess: onSuccess,
                              onFail: onFail
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0))
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void onSuccess() {

  }

  void onFail() {

  }

}