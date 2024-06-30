part of 'regular_exceptions.dart';

validations(
    {required String value,
    required String type,
    String? password2,
    String? password1}) {
  if (value.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  for (var i in RegularExceptions.disallowedSymbols) {
    if (value.startsWith(i) ||
        value.contains(' ') ||
        value.endsWith(i) ||
        value.endsWith(' ')) {
      return 'خطا في المدخلات';
    }
  }

  switch (type) {
    case 'email':
      if (value.length < 8) return 'البريد الإلكتروني يجب يكون اكبر من 8';
      if (value.contains(' ')) {
        return 'البريد الإلكتروني يجب ان لا يحتوي على مسافات';
      }
      if (!value.contains('@')) return 'خطا في البريد الإلكتروني';

      for (var i in RegularExceptions.disallowedSymbols) {
        if (value.startsWith(i) || value.endsWith(i)) {
          return 'خطا في البريد الإلكتروني';
        }
      }
      for (int i = 0; i < RegularExceptions.disallowedSymbols.length - 4; i++) {
        if (value.contains(RegularExceptions.disallowedSymbols[i])) {
          return 'خطا في البريد الإلكتروني';
        }
      }

      if (RegExp(RegularExceptions.noArabic).hasMatch(value)) {
        return 'البريد الإلكتروني يجب ان لايحتوي على حرف عربي';
      }

    case 'password':
      if (value.length <= 8) return 'كلمة المرور يجب تكون اكبر من 7';
      if (value.length > 16) return 'كلمة المرور يجب ان تكون اصغر من 17';
      if (value.contains(' ')) return 'كلمة المرور يجب ان لاتحتوي على مسافات';

      for (var i in RegularExceptions.disallowedSymbols) {
        if (value.contains(i)) return 'كلمة المرور يجب ان لا تحتوي على رمز ';
      }

      if (!RegExp(RegularExceptions.musetContintLowerChar).hasMatch(value)) {
        return 'كلمة المرور يجب ان تحتوي على حرف ';
      }
      // if (!RegExp(RegularExceptions.musetContintUperChar).hasMatch(value)) {
      //   return 'كلمة المرور يجب ان تحتوي على حرف كبتل';
      // }
      if (!RegExp(RegularExceptions.musetContintNumber).hasMatch(value)) {
        return 'كلمة المرور يجب ان تحتوي على رقم ';
      }

      if (RegExp(RegularExceptions.noArabic).hasMatch(value)) {
        return 'كلمة المرور يجب ان لاتحتوي على حرف عربي';
      }
      if (password2 != null) {
        if (password1 != password2) {
          return 'كلمة المرور غير متطابقه';
        }
      }
    // case 'name':
    case 'phone':
      if (value.length < 9) return 'رقم الجوال يجب يكون 9 ارقام';
      if (!RegExp(RegularExceptions.phoneReg).hasMatch(value)) {
        return 'يجب ان يكون رقما';
      }
  }
}
