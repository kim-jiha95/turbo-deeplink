package com.turbodeeplink

import android.app.Service
import android.content.Intent
import android.os.Binder
import android.os.IBinder
import android.util.Log

class DeepLinkService : Service() {
    private val binder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): DeepLinkService = this@DeepLinkService
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    fun handleDeepLink(url: String) {
        Log.d("DeepLinkService", "Handling deep link: $url")
    }
} 