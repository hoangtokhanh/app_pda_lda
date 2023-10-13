package com.example.app_pda_lda;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.os.Vibrator;
import android.util.Log;
import android.view.WindowManager;
import android.widget.Toast;

import androidx.annotation.NonNull;

import java.util.Timer;
import java.util.TimerTask;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
public class MainActivity extends FlutterActivity {
    static final String DEVICE_CHANNEL = "PDA";
    static final String SCAN_CHANNEL = "PDA-SCAN";
    String barcode = "SCAN QR CODE";
    public boolean flag = false;
    TimerTask timerTaskConnection;
    Timer timerConnection;

    @Override
    public void onBackPressed() {
        if (flag)
            super.onBackPressed();
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        Context context = getApplicationContext();
        Intent intent = new Intent("ACTION_BAR_SCANCFG");
        intent.putExtra("EXTRA_TRIG.MODE", 2);
        intent.putExtra("SCAN_TIMEOUT", 9000);
        intent.putExtra("EXTRA_SCAN_MODE", 3);
        intent.putExtra("EXTRA_SCAN_AUTOENT", 1);
        intent.putExtra("EXTRA_SCAN_POWER", 1);
        intent.putExtra("EXTRA_SCAN_NOTY_SND", 0);
        intent.putExtra("EXTRA_SCAN_NOTY_VIB", 0);

        context.sendBroadcast(intent);

        MediaPlayer mediaSuccess = MediaPlayer.create(context, R.raw.beep);
        MediaPlayer mediaError = MediaPlayer.create(context, R.raw.error);
        Vibrator vibs = (Vibrator) context.getSystemService(VIBRATOR_SERVICE);

        MethodChannel flutter_channel = new MethodChannel(messenger, "FlutterChannel");

        timerTaskConnection = new TimerTask() {
            @Override
            public void run() {
                runOnUiThread(() -> flutter_channel.invokeMethod("getData", null));

            }
        };
        timerConnection = new Timer("checkconnection");
        timerConnection.schedule(timerTaskConnection, 2500L, 5000L);

        new EventChannel(flutterEngine.getDartExecutor(), SCAN_CHANNEL).setStreamHandler(
                new EventChannel.StreamHandler() {
                    private BroadcastReceiver QRCodeStateChangeReceiver;

                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {
                        QRCodeStateChangeReceiver = createQRStateChangeReceiver(events);
                        IntentFilter filter = new IntentFilter();
                        filter.addAction("nlscan.action.SCANNER_RESULT");
                        registerReceiver(QRCodeStateChangeReceiver, filter);
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        unregisterReceiver(QRCodeStateChangeReceiver);
                    }
                }
        );
        MethodChannel channel = new MethodChannel(messenger, DEVICE_CHANNEL);

        channel.setMethodCallHandler(((call, result) -> {
            switch (call.method) {
                case "disable_back":
                    Log.v("vanhanh", "disable_back");
                    flag = false;
                    break;
                case "enable_back":
                    Log.v("vanhanh", "enable_back");
                    flag = true;
                    break;
                case "enable_scan":
                    intent.putExtra("EXTRA_SCAN_POWER", 1);
                    context.sendBroadcast(intent);
                    Log.v("vanhanh", "enable_scan");
                    break;
                case "disable_scan":
                    intent.putExtra("EXTRA_SCAN_POWER", 0);
                    context.sendBroadcast(intent);
                    Log.v("vanhanh", "disable_scan");
                    break;
                case "signal_success":
                    Log.v("vanhanh", "signal_success");
                    mediaSuccess.start();
                    vibs.vibrate(300);
                    break;
                case "signal_error":
                    Log.v("vanhanh", "signal_error");
                    mediaError.start();
                    vibs.vibrate(300);
                    break;
                default:
                    result.notImplemented();
            }
        }));
    }

    private BroadcastReceiver createQRStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                if (intent != null) {
                    barcode = intent.getStringExtra("SCAN_BARCODE1");
                    events.success(barcode);
                }

            }
        };
    }


}