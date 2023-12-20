import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart";

enum ActivePlatform {
  ios,
  macos,
  android,
  web,
  linux,
  windows,
  fuchsia,
}

enum SupportedPlatform {
  ios,
}

enum PlatformEnv {
  web,
  mobile,
  desktop,
  mobileWeb,
}

class Device {
  // TODO configure all platforms
  // https://pub.dev/packages/flutter_secure_storage#flutter_secure_storage
  late PlatformEnv platformEnv;
  late dynamic options;
  late ActivePlatform activePlatform;

  Device() {
    try {
      platformEnv = determineEnv();
      activePlatform = determinePlatform();

    } catch (e) {
      // TODO application error handling
      print("Could not init Device reading with error: $e");
    }
  }

  String getPlatform() {
    return activePlatform.name;
  }

  String getPlatformEnv() {
    return platformEnv.name;
  }

  PlatformEnv determineEnv() {
    if (GetPlatform.isWeb && !GetPlatform.isMobile) {
      return PlatformEnv.web;
    } else if (GetPlatform.isWeb && GetPlatform.isMobile) {
      return PlatformEnv.mobileWeb;
    } else if (GetPlatform.isDesktop) {
      return PlatformEnv.desktop;
    } else {
      throw Exception("Failed to determine platform environment.");
    }
  }

  ActivePlatform determinePlatform() {
    if (GetPlatform.isIOS) {
      return ActivePlatform.ios;
    } else if (GetPlatform.isAndroid) {
      return ActivePlatform.android;
    }
    //  else if (GetPlatform.isWeb) {
    //   // TODO read the documentation deeper. Is this one needed here?
    //   return ActivePlatform.web;
    // } 
    else if (GetPlatform.isWindows) {
      return ActivePlatform.windows;
    } else if (GetPlatform.isMacOS) {
      return ActivePlatform.macos;
    } else if (GetPlatform.isLinux) {
      return ActivePlatform.linux;
    } else if (GetPlatform.isFuchsia) {
      // TODO double check this is the correct intention...
      // do not see any FuchsiaOptions, only LinuxOptions.
      //return ActivePlatform.fuchsia;
      return ActivePlatform.linux;
    } else {
      throw Exception("Failed to determine OS.");
    }
  }

  AndroidOptions getAndroidOptions() {
    // https://pub.dev/packages/flutter_secure_storage#configure-android-version
    return const AndroidOptions(
      encryptedSharedPreferences: true
    );
  }

  IOSOptions getIosOptions() {
    return const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  }

  LinuxOptions getLinuxOptions() {
    // TODO extra steps to configure linux here:
    // https://pub.dev/packages/flutter_secure_storage#configure-web-version
    return const LinuxOptions();
  }

  MacOsOptions getMacosOptions() {
    // TODO extra steps to configure macos here:
    // https://pub.dev/packages/flutter_secure_storage#configure-web-version
    return const MacOsOptions();
  }
  
  WebOptions getWebOptions() {
    // NOTE: experimental
    // https://pub.dev/packages/flutter_secure_storage#configure-web-version
    return const WebOptions();
  }
}

