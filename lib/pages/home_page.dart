import 'package:flutter/material.dart';
import 'kalkulator.dart';
import 'ganjilgenap.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue[600],
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blue[50]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menu Pilihan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElevatedButton(
                    context,
                    'Anggota Kelompok',
                    const AnggotaKelompokPage(),
                  ),
                  _buildElevatedButton(
                    context,
                    'Kalkulator',
                    const CalculatorPage(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildElevatedButton(
                context,
                'Ganjil Genap',
                const NumberPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(
      BuildContext context, String label, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[400],
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Colors.blue.withOpacity(0.4),
        elevation: 8,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

class AnggotaKelompokPage extends StatelessWidget {
  const AnggotaKelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan tombol back
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text(
          'Anggota Kelompok',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Fungsi back ke halaman sebelumnya
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blue[50]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  'Anggota Kelompok:',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '1. Nabil Dzak - 124220091\n'
                  '2. Andrian Jo - 124220120',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
