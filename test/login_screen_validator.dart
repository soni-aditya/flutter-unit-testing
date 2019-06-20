import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/home.dart';

void main() {
  test('Empty Email Test', () {
    var result = FormValidator.validateEmail('');
    expect(result, 'Enter Email!');
  });

  test('Invalid Email Test', () {
    var result = FormValidator.validateEmail('');
    expect(result, 'Enter Valid Email!');
  });

  test('Valid Email Test', () {
    var result = FormValidator.validateEmail('ajay.kumar@nonstopio.com');
    expect(result, null);
  });

  test('Empty Password Test', () {
    var result = FormValidator.validatePassword('');
    expect(result, 'Enter Password!');
  });

  test('Invalid Password Test', () {
    var result = FormValidator.validatePassword('123');
    expect(result, 'Password must be more than 6 charater');
  });

  test('Valid Password Test', () {
    var result = FormValidator.validatePassword('ajay12345');
    expect(result, null);
  });
}
