import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';

  TextEditingController _inputDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          SizedBox(height: 20.0),
          _createEmail(),
          SizedBox(height: 20.0),
          _createPassword(),
          SizedBox(height: 20.0),
          _createDate(context),
          SizedBox(height: 20.0),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Chars: ${_name.length}'),
        hintText: 'Name',
        labelText: 'Name',
        helperText: 'Name only',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name is $_name.'),
      subtitle: Text('$_email'),
    );
  }

  Widget _createEmail() {
    return TextField(
      // autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Chars: ${_email.length}'),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Email only',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      // autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Chars: ${_password.length}'),
        hintText: 'Password',
        labelText: 'Password',
        helperText: 'Password only',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock_outline),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
          // print(_password);
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      // autofocus: false,
      enableInteractiveSelection: false,
      controller: _inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Chars: ${_password.length}'),
        hintText: 'Birth Date',
        labelText: 'Birth Date',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1940),
      lastDate: new DateTime(2031),
      // locale: Locale('es', 'ES'),
    );

    if (selected != null) {
      setState(() {
        _date = selected.toString();
        _inputDateController.text = _date;
      });
    }
  }
}
