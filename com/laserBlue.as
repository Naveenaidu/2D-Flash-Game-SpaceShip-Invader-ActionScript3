package com {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class laserBlue extends MovieClip{
		
		private var stageRef:Stage;
		private var posx:Number;
		private var posy:Number;
		private var bulletSpeed:Number = 16;

		public function laserBlue(stageRef:Stage,posx:int,posy:int) {
			
			this.stageRef = stageRef;
			x = posx;
			y = posy;
			
			addEventListener(Event.ENTER_FRAME,loop);
			
		}
		
		public function loop(e:Event):void{
			
		    
			y = y - bulletSpeed;
			
			//Remove the bullet once it goes out of frame
			if(y<0){
				removeSelf();
			}
			
		}
		
		public function removeSelf():void{
			
			//Check if this object has ever been removed from the frame every frame. If yes go to loop function and check
			//the 'y' coordinate of the laser.
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
					stageRef.removeChild(this);
		}

	}
	
}
