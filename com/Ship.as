package com {
	
	import flash.display.MovieClip;
	import com.senocular.utils.KeyObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Ship extends MovieClip {
		
		private var stageRef:Stage;
		private var key:KeyObject;
		private var vx:Number = 0 ;
		private var vy:Number = 0;
		private var speed:Number = 0.5;
		private var friction:Number = 0.98;
		private var maxSpeed:Number = 8;
		
		private var fireTimer:Timer;
		private var canFire:Boolean = true;
		
		public function Ship(stageRef:Stage) {
			
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			//setup your fireTimer and attach a listener to it.
			fireTimer = new Timer(300,1);
			fireTimer.addEventListener(TimerEvent.TIMER, fireTimerHandler);
			
			addEventListener(Event.ENTER_FRAME,loop);

		}
		
		
		public function loop(e:Event):void{
			
				//Calculating the speed and friction.
				if(key.isDown(Keyboard.LEFT)){
					vx = vx - speed;
				}
				else if(key.isDown(Keyboard.RIGHT)){
					vx = vx + speed;
				}
				else{
					vx = vx * friction;
				}
				
				if(key.isDown(Keyboard.UP)){
					vy = vy - speed;
				}
				else if(key.isDown(Keyboard.DOWN)){
					vy = vy + speed;
				}
				else{
					vy = vy * friction;
				}
				
				if(key.isDown(Keyboard.SPACE)){
					fireBullet();
				}
			
				//Updating the positions
				x = x + vx;
				y = y + vy;
				
				rotation = vx;
				
				//Setting the maxspeed
				if(vx >= maxSpeed){
					vx = maxSpeed;
				}
				else if (vx <= -maxSpeed){
					vx = -maxSpeed;
				}
				
				if(vy >= maxSpeed){
					vy = maxSpeed;
				}
				else if (vy <= -maxSpeed){
					vy = -maxSpeed;
				}
				
				//Setting the Bounce Back conditions at boundary
				
				if( x > stage.stageWidth){
					x = stage.stageWidth;
					vx = -vx;
				}
				else if (x < 0){
					x = 0;
					vx = -vx;
				}
				
				if( y > stage.stageHeight){
					y = stage.stageHeight;
					vy = -vy;
				}
				else if (y < 0){
					y = 0;
					vy = -vy;
				}
				
				
		}
		
		
		private function fireBullet() : void
		{
			//if canFire is true, fire a bullet
			//set canFire to false and start our timer
			//else do nothing.
			if (canFire)
			{
				stageRef.addChild(new laserBlue(stageRef, x + vx, y - 10));
				canFire = false;
				fireTimer.start();
			}
			
		}
		
		//HANDLERS
		
		private function fireTimerHandler(e:TimerEvent) : void
		{
			//timer ran, we can fire again.
			canFire = true;
		}

	}
	
}
