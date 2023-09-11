extension StringHelpers on String {
  //!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
  bool get isPasswordValid => RegExp(
          r"""^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[!#$%&'"()+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d!#$%&'"()+,-./:;<=>?@[\]^_`{|}~]{8,15}$""")
      .hasMatch(this);
}
