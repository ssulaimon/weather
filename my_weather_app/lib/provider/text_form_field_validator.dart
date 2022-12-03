class TextFormFieldValidator {
  validateValue({required String? value}) {
    if (value!.isEmpty) {
      return 'Please Enter a City or Location';
    } else if (value.length == 1) {
      return 'Text lenght is too short';
    } else {
      return null;
    }
  }
}
