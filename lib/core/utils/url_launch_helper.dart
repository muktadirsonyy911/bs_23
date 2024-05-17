import 'package:url_launcher/url_launcher.dart';

class UrlLaunchHelper{
  static UrlLaunchHelper? _urlLaunchHelper;

  UrlLaunchHelper._();

  static UrlLaunchHelper get urlLaunchHelper => _urlLaunchHelper ??= UrlLaunchHelper._();


  Future<void> urlLauncher(String? link) async {
    Uri url=Uri.parse(link??'');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
    }
  }
}