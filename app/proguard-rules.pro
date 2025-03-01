# Latest ProGuard rules for Android and AGP 8.3.0
# More details: https://developer.android.com/studio/build/shrink-code

# Keep class members for WebView JavaScript interface
# Uncomment and specify the class name if using JavaScript in WebView
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Preserve line number information for debugging stack traces
-keepattributes SourceFile,LineNumberTable

# Hide original source file names in stack traces
-renamesourcefileattribute SourceFile

# Keep essential Android classes used in reflection
-keep public class * extends android.app.Application { *; }
-keep public class * extends android.app.Activity { *; }
-keep public class * extends android.app.Service { *; }
-keep public class * extends android.content.BroadcastReceiver { *; }
-keep public class * extends android.content.ContentProvider { *; }

# Keep native JNI methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Ensure Gson serialization works
-keep class com.google.gson.** { *; }

# Keep classes with annotations like @Keep
-keep @androidx.annotation.Keep class * { *; }

# Optimize and remove unused code
-dontoptimize
-dontshrink
-dontobfuscate
