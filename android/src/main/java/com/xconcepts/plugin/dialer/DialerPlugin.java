package com.xconcepts.plugin.dialer;

import android.content.Intent;
import android.net.Uri;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Dialer")
public class DialerPlugin extends Plugin {

    private Dialer implementation = new Dialer();

    @PluginMethod
    public void openDialer(PluginCall call) {
        // String value = call.getString("value");

        // JSObject ret = new JSObject();
        // ret.put("value", implementation.echo(value));
        // call.resolve(ret);
        String phoneNumber = call.getString("phoneNumber");
        if (phoneNumber == null) {
            call.reject("Must provide a phone number");
            return;
        }

        Intent intent = new Intent(Intent.ACTION_DIAL);
        intent.setData(Uri.parse("tel:" + phoneNumber));
        getActivity().startActivity(intent);

        call.resolve(new JSObject());
    }
}
