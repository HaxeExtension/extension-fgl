package lime.extension.fgl;

import android.content.Intent;
import org.haxe.extension.Extension;

public class FGL extends Extension {
    
	public static void showAd() {
		mainActivity.sendBroadcast(new Intent("com.fgl.INVOKE").putExtra("command", "showAd").putExtra("source", "openfl"));
	}

}