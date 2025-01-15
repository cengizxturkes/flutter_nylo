import 'package:nylo_framework/nylo_framework.dart';

/* Login Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class LoginForm extends NyFormData {
  LoginForm({String? name}) : super(name ?? "login");

  @override
  fields() => [
        Field.password(
          "Password",
          validate: FormValidator.password(),
        ),
        Field.date("Birth Date",
            firstDate: DateTime(1900), lastDate: DateTime.now()),
        Field.mask("Phone", mask: "(###) ###-####"),
      ];
}
