package com.shivammishra.platform_metadata

import android.content.pm.PackageManager
import androidx.annotation.NonNull
import android.app.Application
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** PlatformMetadataPlugin */
class PlatformMetadataPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var application: Application

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_metadata")
    channel.setMethodCallHandler(this)
    application =
      flutterPluginBinding.applicationContext as Application
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "getMetaData" -> {
        var metaDataValue:String?
        try {
          val appInfo = application.packageManager.getApplicationInfo(
            application.packageName,
            PackageManager.GET_META_DATA
          )
          metaDataValue = appInfo.metaData.getString(call.arguments.toString())
        } catch (e: PackageManager.NameNotFoundException) {
          metaDataValue = "";
          e.printStackTrace()
        }
        result.success(metaDataValue);
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
