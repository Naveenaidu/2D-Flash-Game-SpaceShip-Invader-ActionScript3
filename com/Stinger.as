package com {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Stinger extends MovieClip{
		
		private var stageRef:Stage;
		private var target:Ship;
		public var vx:Number = 1;
		private var posX:Number;
		private var posY:Number;

		public function Stinger(stageRef:Stage,target:Ship):void {
			
			this.stageRef = stageRef;
			this.target = target;
			
			
			
			addEventListener(Event.ENTER_FRAME,loop);
			
		}
		
		public function loop(e:Event):void{
			
			//Making the Ship move towards right
			//vx = vx + 0.2;
			x = x + vx;
			posX = x;
			posY = y;
			//trace(posX);
		
			
		}
		
		public function setPosition(posx:Number,posy:Number):void{
			this.x = posx;
			this.y = posy;
		}
		
		public function getXpos():Number{
			//trace(posX);
			return (posX);
		}
		
		public function getYpos():Number{
			return (posY);
		}
		
		
	

}
}

/*
if ( x > stageRef.stageWidth){
				//vx = -vx + 0.2;
				//y = stageRef.stageWidth/2- 110;
				x = stageRef.stageWidth;
				vx = -vx;
				y = stage.stageHeight/2 - 110;
				//x = stageRef.width;
				
				
			//	nextLoop();
			}
			else if(x <0){
				x = 0;
				vx = -vx;
				y = stage.stageHeight/2 - 90;
			}
*/