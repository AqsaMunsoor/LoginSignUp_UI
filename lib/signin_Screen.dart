import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _usernameErrorText;
  String? _passwordErrorText;

  void _validateInputs() {
    setState(() {
      _usernameErrorText = null;
      _passwordErrorText = null;

      if (_usernameController.text.isEmpty) {
        _usernameErrorText = 'Please enter a username';
      }

      if (_passwordController.text.isEmpty) {
        _passwordErrorText = 'Please enter a password';
      }
    });

    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 25,
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
          SizedBox(
            width: size.width / 16,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(15.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 1.4,
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width / 1.3,
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                labelText: 'Username',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 30.0),
                                errorText: _usernameErrorText,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.transparent),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: size.width / 1.3,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                labelText: 'Password',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 30.0),
                                errorText: _passwordErrorText,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.transparent),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.end,
                                  )),
                              SizedBox(
                                width: size.width / 16,
                              )
                            ],
                          ),
                          SizedBox(
                            width: size.width / 1.3,
                            height: size.height / 14,
                            child: ElevatedButton(
                              onPressed: _validateInputs,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 1.3,
                      height: size.height / 14,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey.shade100,
                          elevation: 8,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/128/300/300221.png',
                              fit: BoxFit.contain,
                              width: 40,
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_rounded,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: size.width / 1.3,
                      height: size.height / 14,
                      child: ElevatedButton(
                        onPressed: _validateInputs,
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.grey.shade100,
                          elevation: 8,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 40,
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/128/5968/5968764.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_rounded,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
