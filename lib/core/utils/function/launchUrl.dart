import 'package:bookly_app/core/utils/function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? ulr) async {
  if (ulr != null) {
    Uri uri = Uri.parse(ulr);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, 'cannot launch:$uri');
    }
  }
}


