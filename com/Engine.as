package com {
	
	import flash.display.MovieClip;
	import flash.display.Stage;	
	import flash.events.Event;
	
	public class Engine extends MovieClip {
		
		//List to keep track of enemies
		public static var enemyList:Array = new Array();
		public static var enemyList1:Array = new Array();
		public static var enemyList2:Array = new Array();
		private var numEnemies:Number = 15;
		private var enemyPosX:Number;
		private var enemyPosY:Number;
		private var movingRight:Boolean = true;
		private var moveDistance = 30;

		public function Engine() {
			
			var ourShip:Ship = new Ship(stage);
			stage.addChild(ourShip);
			
			ourShip.x = stage.stageWidth/2;
			ourShip.y = stage.stageHeight/2;
			
	///////////////////////////////////////////////////////////////////////////////////////////////////////

			//SETTING UP THE ENEMY SHIPS
			
			//Initializing the start positions
			
			//Row1
			enemyPosX = 150;
			enemyPosY = 50;
			for(var i:int=0;i<10;i++){
				enemyPosX+=30 
				var enemy:Stinger = new Stinger(stage,ourShip);
				enemy.setPosition(enemyPosX,enemyPosY);
				stage.addChild(enemy);
				enemyList.push(enemy);
			}
			
			
			
			//Row2
			enemyPosX = 150;
			enemyPosY+=40;
			for(var i:int=0;i<10;i++){
				enemyPosX+=30 
				var enemy1:Stinger = new Stinger(stage,ourShip);
				enemy1.setPosition(enemyPosX,enemyPosY);
				stage.addChild(enemy1);
				enemyList1.push(enemy1);
			}
			
			
			
			//Row3
			enemyPosX = 150;
			enemyPosY+=40;
			for(var i:int=0;i<10;i++){
				enemyPosX+=30 
				var enemy2:Stinger = new Stinger(stage,ourShip);
				enemy2.setPosition(enemyPosX,enemyPosY);
				stage.addChild(enemy2);
				enemyList2.push(enemy2);
			}
			
			addEventListener(Event.ENTER_FRAME,loop);

		}
		
		//Keep checking for the edge conditions every frame. Since PosX changes every frame
		public function loop(e:Event):void{
			trace(enemyList[1].getXpos());
			trace(enemyList[1].getYpos());
			trace(enemyList[1].vx);
			
			
			if(true){
				
				//First step to check if the alien furthest to the right has hit a edge or not
				
				//Change the condition of the array so that it points to the least element of the array
				for(var i:int = 9 ; i>=0 ; i--){
					
						if(enemyList[i].getXpos() > 520 || enemyList[i].getXpos() < 10 ){
							
							//Changing Direction
							movingRight = false;
							
							//Setting the new y location
							for(var j:int = 0 ; j < enemyList.length ; j++){
								enemyList[j].setPosition(enemyList[j].getXpos(),enemyList[j].getYpos() + moveDistance);
								enemyList[j].vx = -enemyList[j].vx;
								enemyList1[j].setPosition(enemyList1[j].getXpos(),enemyList1[j].getYpos() + moveDistance);
								enemyList1[j].vx = -enemyList1[j].vx;
								enemyList2[j].setPosition(enemyList2[j].getXpos(),enemyList2[j].getYpos() + moveDistance);
								enemyList2[j].vx = -enemyList2[j].vx;

							}
						}
							
							if(enemyList1[i].getXpos() > 520 || enemyList1[i].getXpos() < 0 ){
							
							//Changing Direction
							movingRight = false;
							
							//Setting the new y location
							for(var j:int = 0 ; j < enemyList1.length ; j++){
								enemyList[j].setPosition(enemyList[j].getXpos(),enemyList[j].getYpos() + moveDistance);
								enemyList[j].vx = -enemyList[j].vx;
								enemyList1[j].setPosition(enemyList1[j].getXpos(),enemyList1[j].getYpos() + moveDistance);
								enemyList1[j].vx = -enemyList1[j].vx;
								enemyList2[j].setPosition(enemyList2[j].getXpos(),enemyList2[j].getYpos() + moveDistance);
								enemyList2[j].vx = -enemyList2[j].vx;

							}
						}
							
							if(enemyList2[i].getXpos() > 520 || enemyList2[i].getXpos() < 0 ){
							
							//Changing Direction
							movingRight = false;
							
							//Setting the new y location
							for(var j:int = 0 ; j < enemyList2.length ; j++){
								enemyList[j].setPosition(enemyList[j].getXpos(),enemyList[j].getYpos() + moveDistance);
								enemyList[j].vx = -enemyList[j].vx;
								enemyList1[j].setPosition(enemyList1[j].getXpos(),enemyList1[j].getYpos() + moveDistance);
								enemyList1[j].vx = -enemyList1[j].vx;
								enemyList2[j].setPosition(enemyList2[j].getXpos(),enemyList2[j].getYpos() + moveDistance);
								enemyList2[j].vx = -enemyList2[j].vx;

							}
						}
							
							
							
							
						
					
				}
			}
			
		}

	}
}
/*
for(var i:int = 0; i < numEnemies ; i++){
				
				var enemy:Stinger = new Stinger(stage,ourShip);
				stage.addChild(enemy);
				enemyList.push(enemy);
				enemy.x = enemyPosX;
				enemy.y = enemyPosY;
				enemyPosX+=30;
				trace(i);
				trace(enemyPosX);
				trace(enemyList[i].x);
				
				
			}
			
			enemyPosX = stage.stageWidth/2 - 115;
			enemyPosY = stage.stageHeight/2 - 120;
		
			for(var j:int = 0; j < numEnemies ; j++){
				trace("loop 2");
				var enemy1:Stinger = new Stinger(stage,ourShip);
				stage.addChild(enemy1);
				enemyList.push(enemy1);
				enemy1.x = enemyPosX;
				enemy1.y = enemyPosY+30;
				enemyPosX+=30;
				trace("enemey2");
				trace(enemy1.x);
				
				
			}
*/