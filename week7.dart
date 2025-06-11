import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Send Money App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LoginPage(),
    );
  }
}

// Part 1: Login Page with Transition
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DashboardPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// Part 2: Dashboard Page with Send Money Page Entry
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: ElevatedButton(
          child: Text('Send Money'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SendMoneyPage()),
            );
          },
        ),
      ),
    );
  }
}

// Part 3: Send Money Page
class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedMethod = 'Bank Transfer';
  bool _isFavorite = false;
  bool _showSuccess = false;

  List<String> _methods = ['Bank Transfer', 'Mobile Money', 'Cash'];

  void _sendMoney() {
    if (_formKey.currentState!.validate()) {
      setState(() => _showSuccess = true);
      Future.delayed(Duration(seconds: 3), () {
        setState(() => _showSuccess = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _recipientController,
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter amount';
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) return 'Enter valid amount';
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedMethod,
                onChanged: (value) => setState(() => _selectedMethod = value!),
                items: _methods.map((method) {
                  return DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Payment Method'),
              ),
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: _isFavorite,
                onChanged: (val) => setState(() => _isFavorite = val),
              ),
              SizedBox(height: 20),
              SendMoneyButton(onPressed: _sendMoney),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _showSuccess ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _showSuccess ? 50 : 0,
                  color: Colors.green.shade100,
                  alignment: Alignment.center,
                  child: Text('Money Sent Successfully!',
                      style: TextStyle(color: Colors.green)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Send Money Button Widget
class SendMoneyButton extends StatelessWidget {
  final VoidCallback onPressed;

  SendMoneyButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Send Money',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
