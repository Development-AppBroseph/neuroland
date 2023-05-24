import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseSevice {
  static Future<String> copyLink(String refCode) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://neuroland.page.link/referal/&ref_code=$refCode'),
      uriPrefix: 'https://neuroland.page.link',
      googleAnalyticsParameters: const GoogleAnalyticsParameters(),
      androidParameters:
          const AndroidParameters(packageName: 'dev.broseph.neurodom'),
      iosParameters: const IOSParameters(
        bundleId: 'dev.broseph.neuroland',
        appStoreId: '1668195949',
      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(parameters);
    String link = dynamicLink.toString();
    return link;
  }
}
