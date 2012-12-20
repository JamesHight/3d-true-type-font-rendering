package {
	import com.zavoo.fonts.Font3DLoader;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	import org.papervision3d.materials.special.Letter3DMaterial;
	import org.papervision3d.typography.Font3D;
	import org.papervision3d.typography.Text3D;
	import org.papervision3d.view.BasicView;

	public class Font3DTest extends BasicView {
		
		private var urlLoader:URLLoader;		
		private var text3D:Text3D;
		
		public function Font3DTest() {
			urlLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			urlLoader.load(new URLRequest("assets/fonts/ACTIONIS.TTF"));
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(event:Event):void {
				
			var font3D:Font3D = Font3DLoader.load(urlLoader.data);
			urlLoader = null;
			
			var letter3DMaterial:Letter3DMaterial = new Letter3DMaterial(0xffffff);
			
			text3D = new Text3D("Dynamic text rendered\n using \"ACTION IS\" TrueType font file\nfrom 1001freefonts.com", font3D, letter3DMaterial);
			text3D.scaleX = 1.5;
			text3D.scaleY = 2;							
			scene.addChild(text3D);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			
		}
		
		private function onEnterFrame(event:Event):void {
			text3D.rotationY += (viewport.containerSprite.mouseX - text3D.rotationY) * .01;
			singleRender();
		}

	}
}
