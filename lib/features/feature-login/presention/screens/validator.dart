import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Validator {
  final _email = BehaviorSubject<String>.seeded("");
  final _password = BehaviorSubject<String>.seeded("");

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get sinkEmail => _email.sink.add;

  Function(String) get sinkPassword => _password.sink.add;

  Stream<bool> get loginValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  final validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 1) {
      isEmail(value)
          ? sink.add(value)
          : sink.addError('Please Enter Valid Email !!');
    }
  });
  final validatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isEmpty || value.length < 9) {
      sink.addError('Your Password must Be More Than 8 Characters.');
    } else if (RegExp("[A-Z]").hasMatch(value) == false) {
      sink.addError('Need UpperCase Character.');
    } else if (RegExp("[a-z]").hasMatch(value) == false) {
      sink.addError('Need LowerCase Character.');
    } else if (RegExp("[0-9]").hasMatch(value) == false) {
      sink.addError('Need Number Character.');
    } else if (RegExp(r'''[$*.[\]{}()?\-"'!@#%&/\\,><:;_~`+=]''')
        .hasMatch(value) ==
        false) {
      sink.addError('Need Special Character.');
    } else {
      sink.add(value);
    }
  });

  static bool isEmail(String email) {
    String value =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(email);
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
