import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/viewModel/ChangeAdreess/cubit.dart';
import 'package:testbuild/viewModel/ChangeAdreess/states.dart';

class changeadress extends StatefulWidget {
  @override
  _changeadressState createState() => _changeadressState();
}

class _changeadressState extends State<changeadress> {
  final _formKey = GlobalKey<FormState>();
  String? street;
  String? city;
  String? country;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeAdressCubit()..getinfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Change Address'),
        ),
        body: BlocConsumer<ChangeAdressCubit, ChangeAdressStates>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: context.read<ChangeAdressCubit>().data0.isEmpty
                  ? CircularProgressIndicator()
                  : Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText:
                                    'Street ${context.read<ChangeAdressCubit>().data0.first.adreessesstreet}'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a street';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              street = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText:
                                    'City  ${context.read<ChangeAdressCubit>().data0.first.adreessescity}'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a city';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              city = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText:
                                    'Country  ${context.read<ChangeAdressCubit>().data0.first.adreessescountry}'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a country';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              country = value;
                            },
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              _saveAddress();
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Call a function to save the address to Firebase Firestore
                                _saveAddress();
                              }
                            },
                            child: Text('Save Address'),
                          ),
                        ],
                      ),
                    ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  void _saveAddress() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({
      'adreessesstreet': '$street',
      'adreessescity': '$city',
      'adreessescountry': '$country',
    }).then((value) {
      var snackBar = SnackBar(
        content: Text(
          "Add Adreess SuccessFully ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
