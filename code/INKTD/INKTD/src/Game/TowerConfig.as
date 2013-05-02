﻿package Game{		public final class TowerConfig	{		public var type:int;		public var behaviorType:int;		public var description:String;		public var longDescription:String;		public var price:int;		public var damage:int;		public var speed:int;		public var missileSpeed:int;		public var range:int;				public static const List:Vector.<TowerConfig> = new Vector.<TowerConfig>(8, true);				List[0] = new TowerConfig();		List[0].description = "Basic";		List[0].behaviorType = BehaviorTypes.Normal;		List[0].longDescription = "Fast, cheap and weak";		List[0].type = 1;		List[0].damage = 3;		List[0].price = 10;		List[0].range = 35;		List[0].speed = 30;		List[0].missileSpeed = 6;				List[1] = new TowerConfig();		List[1].description = "Light";		List[1].behaviorType = BehaviorTypes.Normal;		List[1].longDescription = "Does light damage";		List[1].type = 2;		List[1].damage = 5;		List[1].price = 20;		List[1].range = 45;		List[1].speed = 32;		List[1].missileSpeed = 6;				List[2] = new TowerConfig();		List[2].description = "Medium";		List[2].behaviorType = BehaviorTypes.Normal;		List[2].longDescription = "Does medium damage";		List[2].type = 3;		List[2].damage = 8;		List[2].price = 30;		List[2].range = 55;		List[2].speed = 34;		List[2].missileSpeed = 5;				List[3] = new TowerConfig();		List[3].description = "Heavy";		List[3].behaviorType = BehaviorTypes.Normal;		List[3].longDescription = "Hits hard and fast";		List[3].type = 4;		List[3].damage = 12;		List[3].price = 40;		List[3].range = 65;		List[3].speed = 36;		List[3].missileSpeed = 5;						List[4] = new TowerConfig();		List[4].description = "Spike Cannon";		List[4].behaviorType = BehaviorTypes.Spray;		List[4].longDescription = "Shoots in 8 directions";		List[4].type = 5;		List[4].damage = 10;		List[4].price = 100;		List[4].range = 40;		List[4].speed = 50;		List[4].missileSpeed = 5;				List[5] = new TowerConfig();		List[5].description = "Boom Boom";		List[5].behaviorType = BehaviorTypes.Multi2;		List[5].longDescription = "2 unstoppable missiles";		List[5].type = 6;		List[5].damage = 3;		List[5].price = 120;		List[5].range = 40;		List[5].speed = 40;		List[5].missileSpeed = 4;				List[6] = new TowerConfig();		List[6].description = "Big Three";		List[6].behaviorType = BehaviorTypes.Multi3;		List[6].longDescription = "3 unstoppable missiles";		List[6].type = 7;		List[6].damage = 5;		List[6].price = 160;		List[6].range = 50;		List[6].speed = 50;		List[6].missileSpeed = 4;				List[7] = new TowerConfig();		List[7].description = "Quad Color";		List[7].behaviorType = BehaviorTypes.Normal;		List[7].longDescription = "Hits all colors hard";		List[7].type = 8;		List[7].damage = 30;		List[7].price = 200;		List[7].range = 40;		List[7].speed = 46;		List[7].missileSpeed = 4;	}}