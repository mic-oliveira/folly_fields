import 'package:flutter/services.dart';
import 'package:folly_fields/util/mask_text_input_formatter.dart';
import 'package:folly_fields/validators/abstract_validator.dart';

///
///
///
class NcmValidator extends AbstractValidator<String> {
  ///
  ///
  ///
  NcmValidator()
      : super(
          <TextInputFormatter>[
            MaskTextInputFormatter(
              mask: '####.##.##',
            ),
          ],
        );

  ///
  ///
  ///
  @override
  String format(String value) => strip(value).replaceAllMapped(
        RegExp(r'^(\d{4})(\d{2})(\d{2})$'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}',
      );

  ///
  ///
  ///
  @override
  TextInputType get keyboard => TextInputType.number;

  ///
  ///
  ///
  @override
  bool isValid(String ncm) => strip(ncm).length == 8;
}
