package extension.fgl;

#if android
#if (openfl < "4.0.0")
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end
#end

class FGL {
	////////////////////////////////////////////////////////////////////////////	
	private static var __showAd:Void->Void = 
		#if android
			JNI.createStaticMethod("lime/extension/fgl/FGL", "showAd", "()V");
		#else
			function(){};
		#end

	////////////////////////////////////////////////////////////////////////////	
	private static var lastTiempoIntersital:Int = -60*1000;
	private static var displayCallsCounter:Int = 0;

	public static function showAd(minInterval:Int=60, minCallsBeforeDisplay:Int=0) {
		#if android
			displayCallsCounter++;
			if( (flash.Lib.getTimer()-lastTiempoIntersital)<(minInterval*1000) ) return;
			if( minCallsBeforeDisplay > displayCallsCounter ) return;
			displayCallsCounter = 0;
			lastTiempoIntersital = flash.Lib.getTimer();
			try{
				__showAd();
			}catch(e:Dynamic){
				trace("ShowInterstitial Exception: "+e);
			}
		#end
	}
}
