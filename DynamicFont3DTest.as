package {
	import flash.display.Sprite;
		

	[SWF(width="500", height="200", backgroundColor="#ffffff", frameRate="60")]
	public class DynamicFont3DTest extends Sprite {		
		public function DynamicFont3DTest() {			
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, 500, 200);
			this.graphics.endFill();
			
			this.addChild(new Font3DTest());
		}
	}
}
