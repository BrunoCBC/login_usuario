import 'package:asp_teste/core/errors/errors_classes.dart';
import 'package:asp_teste/core/errors/errors_messagens.dart';
import 'package:asp_teste/core/validators/base_validator.dart';

final class MinLengthStrValidator extends BaseValidator<String?> {
  final int minLength;

  MinLengthStrValidator({this.minLength = 3});

  @override
  bool validate(String? validation) {
    return switch (validation) {
      null => throw DefaultError(MessagesError.nullStringError),
      String value when value.length >= minLength =>
        nextValidator?.validate(value) ?? true,
      _ => throw DefaultError(
          '${MessagesError.shorterStringError} - (mínimo $minLength caracteres)'),
    };
  }
}