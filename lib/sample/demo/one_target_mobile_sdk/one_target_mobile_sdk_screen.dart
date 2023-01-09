import 'package:com.roy93group.flutter_tutorial/lib/core/base_stateful_state.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/ui_utils.dart';
import 'package:com.roy93group.flutter_tutorial/lib/util/url_launcher_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_target_mobile_sdk/one_target_mobile_sdk.dart';

import 'constant.dart';

/**
 * Created by Loitp on 08,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class OneTargetMobileSDKScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OneTargetMobileSDKScreenState();
  }
}

class _OneTargetMobileSDKScreenState
    extends BaseStatefulState<OneTargetMobileSDKScreen> {
  Object? _response;

  @override
  void initState() {
    _setupTracking();
    super.initState();
  }

  void _log(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  void _setupTracking() {
    // Constant.setEnv(Constant.environmentDev);
    // Constant.setEnv(Constant.environmentStag);
    Constant.setEnv(Constant.environmentProd);
    G1SDK.instance.setupSDK(
      Constant.getWorkSpaceId(),
      Constant.getOneTargetAppPushID(),
      isShowLog: kDebugMode,
      isEnableIAM: false,
      onLog: (String log) {
        _log("onLog $log");
      },
      env: Constant.getEnv(),
    ).then((isSetupSuccess) {
      _log("_setupTracking isSetupSuccess $isSetupSuccess");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIUtils.getAppBar(
        "one_target_mobile_sdk",
        () {
          Get.back();
        },
        () {
          UrlLauncherUtils.launchInWebViewWithJavaScript(
              "https://pub.dev/packages/one_target_mobile_sdk");
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String?>(
              future: G1SDK.instance.platformVersion,
              builder: (_, snapshot) {
                return Text(snapshot.data ?? '');
              },
            ),
            SampleButton(
              text: "Send event 1",
              onPressed: () {
                _trackEvent1();
              },
            ),
            SampleButton(
              text: "Send event 2",
              onPressed: () {
                _trackEvent2();
              },
            ),
            const SizedBox(height: 32.0),
            const Text('>>>RESPONSE'),
            const SizedBox(height: 16.0),
            if (_response != null)
              Expanded(
                child: ListView(
                  children: [
                    Text(_getPrettyString()),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _trackEvent1() {
    _displayResponse(null);
    var profile = <Map>[];
    profile.add({
      "name": "Loitp Flutter",
      "email": "Loi123@galaxy.one",
    });
    G1SDK.instance.trackEvent(
      {
        "phone": "0766040293",
        "email": "Loi123@galaxy.one",
      },
      profile,
      "event_name",
      {
        "pageTitle": "Passenger Information from Flutter",
        "pagePath": "/home",
      },
      onResponse: (value) {
        _log(">>>onResponse $value");
        _displayResponse(value);
      },
      onFailure: (value) {
        _log(">>>onFailure $value");
        _displayResponse(value);
      },
    );
  }

  void _trackEvent2() {
    _displayResponse(null);
    var profile = <Map>[];
    profile.add({
      "name": "Loi222 Flutter",
      "email": "Loi222@galaxy.one",
    });
    profile.add({
      "name": "Loi333 Flutter",
      "email": "Loi333@galaxy.one",
    });
    profile.add({
      "name": "Loi444 Flutter",
      "email": "Loi444@galaxy.one",
    });
    G1SDK.instance.trackEvent(
      {
        "phone": "0766040293",
        "email": "loitp@galaxy.one",
      },
      profile,
      "track_now_event",
      {
        "name": "Loitp Flutter",
        "bod": "01/01/2000",
        "player_id": 123456,
      },
      onResponse: (value) {
        _log(">>>onResponse $value");
        _displayResponse(value);
      },
      onFailure: (value) {
        _log(">>>onFailure $value");
        _displayResponse(value);
      },
    );
  }

  void _displayResponse(Object? response) {
    setState(() {
      _response = response;
    });
  }

  String _getPrettyString() {
    if (_response == null) {
      return "";
    }
    return _response.toString();
  }
}
