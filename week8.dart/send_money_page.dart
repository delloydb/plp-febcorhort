import 'package:flutter/material.dart';
import 'widgets/send_button.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String _recipient = '';
  double _amount = 0.0;
  String _method = 'M-Pesa';
  bool _favorite = false;
  bool _showSuccess = false;

  final List<String> _methods = ['M-Pesa', 'Bank Transfer', 'PayPal'];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() => _showSuccess = true);
      Future.delayed(Duration(seconds: 2), () {
        setState(() => _showSuccess = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _showSuccess ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text(
                '✅ Transaction Successful!',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Recipient Name'),
                    validator: (value) => value!.isEmpty ? 'Name required' : null,
                    onSaved: (value) => _recipient = value!,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final num = double.tryParse(value ?? '');
                      return (num == null || num <= 0)
                          ? 'Enter valid amount'
                          : null;
                    },
                    onSaved: (value) => _amount = double.parse(value!),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _method,
                    items: _methods.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                    onChanged: (val) => setState(() => _method = val!),
                    decoration: InputDecoration(labelText: 'Payment Method'),
                  ),
                  SwitchListTile(
                    title: Text('Mark as Favorite'),
                    value: _favorite,
                    onChanged: (val) => setState(() => _favorite = val),
                  ),
                  SizedBox(height: 20),
                  SendButton(label: 'Send Money', onPressed: _submit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
