package extension.fgl;

class FGL {
	////////////////////////////////////////////////////////////////////////////	
	public static var showAd:Void->Void = 
		#if android
			openfl.utils.JNI.createStaticMethod("lime/extension/fgl/FGL", "showAd", "()V");
		#else
			function(){};
		#end	
}
