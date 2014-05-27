package extension.fgl;

class FGL {
	////////////////////////////////////////////////////////////////////////////	
	private static var __showAd:Void->Void = 
		#if android
			openfl.utils.JNI.createStaticMethod("lime/extension/fgl/FGL", "showAd", "()V");
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
