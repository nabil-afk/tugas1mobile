import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primaryColor: Colors.blue[600], // Warna biru utama
        fontFamily: 'Roboto', // Font modern dan bersih
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Colors.grey[800]), // Warna teks abu-abu gelap
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _validUsername = "admin";
  final String _validPassword = "123456";

  String _message = "";

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == _validUsername && password == _validPassword) {
      setState(() {
        _message = "Login successful!";
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        _message = "Invalid username or password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600], // Biru cerah untuk AppBar
        title: const Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto', // Font modern
          ),
        ),
        centerTitle: true, // Pusatkan judul
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[50]!,
              Colors.blue[100]!, // Background gradasi biru
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0), // Padding dalam kotak
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person_outline, // Ikon user
                      size: 100,
                      color: Colors.blue[600],
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.blue[600]),
                        prefixIcon: Icon(Icons.person,
                            color: Colors
                                .blue[600]), // Ikon di dalam field username
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.blue[400]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.blue[600]!, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blue[600]),
                        prefixIcon: Icon(Icons.lock,
                            color: Colors
                                .blue[600]), // Ikon kunci di field password
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.blue[400]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Colors.blue[600]!, width: 2.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[400],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _message,
                      style: TextStyle(
                        color: _message == "Login successful!"
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
