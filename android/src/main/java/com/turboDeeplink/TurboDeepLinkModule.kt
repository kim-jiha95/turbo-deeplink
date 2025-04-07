package com.turbodeeplink

import android.content.Intent
import android.net.Uri
import com.facebook.react.bridge.*
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.modules.core.DeviceEventManagerModule

@ReactModule(name = TurboDeepLinkModule.NAME)
class TurboDeepLinkModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    companion object {
        const val NAME = "TurboDeeplink"
    }

    override fun getName(): String = NAME

    override fun canOverrideExistingModule(): Boolean {
        return true
    }

    @ReactMethod
    fun isSupported(promise: Promise) {
        promise.resolve(true)
    }

    @ReactMethod
    fun canOpenURL(url: String, promise: Promise) {
        try {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
            val canOpen = intent.resolveActivity(reactApplicationContext.packageManager) != null
            promise.resolve(canOpen)
        } catch (e: Exception) {
            promise.reject("ERROR", e.message)
        }
    }

    @ReactMethod
    fun openURL(url: String, promise: Promise) {
        try {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            reactApplicationContext.startActivity(intent)
            promise.resolve(true)
        } catch (e: Exception) {
            promise.reject("ERROR", e.message)
        }
    }

    fun handleURL(url: String) {
        reactApplicationContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
            .emit("url", url)
    }
} 