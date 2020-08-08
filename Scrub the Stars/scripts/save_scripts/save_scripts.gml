// ALL SAVE FILE FUNCTIONS

function save_scrapPickup(_id){
	// Get Scrap Section ID
	var scrapSection = "save_" + string(global.saveslot) + "_scraps"; // returns save_1_scraps
	
	ini_open(savefile);
	ini_write_real(scrapSection,_id,1);
	ini_close();
}

function save_playerState(){
	if oPlayer.player_health > 0 then{ // don't save when the players health is 0 or the save will be softlocked
		var saveSection = "save_" + string(global.saveslot); // returns save_1
	
		ini_open(savefile);
		ini_write_real(saveSection, "save_health", oPlayer.player_health);		// Save the Players Health
		ini_write_real(saveSection, "save_upgrades", oPlayer.gun_damage);		// Save gun upgrades
		ini_write_real(saveSection, "save_teleport", oPlayer.teleport_upgrade); // save teleport upgrade
		ini_write_real(saveSection, "save_hover", oPlayer.hover_upgrade);		// save hover upgrades
		ini_write_real(saveSection, "save_boost", oPlayer.gun_boost);			// save the gun boost
		ini_write_real(saveSection, "save_scrap", oPlayer.scrap_count);			// save scrap count
		ini_write_real(saveSection, "save_grenades", oPlayer.v_grenades);		// save how many grenades
		
		ini_write_real(saveSection, "save_moon", global.moonOpen);		// Saves Spacemap Moon Access
		
		ini_close();
	}
}

function load_playerState(){
		var saveSection = "save_" + string(global.saveslot); // returns save_1
		ini_open(savefile);
		oPlayer.player_health	= ini_read_real(saveSection, "save_health", 4);
		oPlayer.gun_damage		= ini_read_real(saveSection, "save_upgrades", 0);
		oPlayer.teleport_upgrade= ini_read_real(saveSection, "save_teleport", 0);
		oPlayer.hover_upgrade	= ini_read_real(saveSection, "save_hover", 0);
		oPlayer.gun_boost		= ini_read_real(saveSection, "save_boost", 0);
		oPlayer.scrap_count		= ini_read_real(saveSection, "save_scrap", 0);
		oPlayer.v_grenades		= ini_read_real(saveSection, "save_grenades", 0);
		oPlayer.inventory = ini_read_string(saveSection,"save_inventory", "000000000");	
		ini_close();
}

function load_spaceMap(){
		var saveSection = "save_" + string(global.saveslot); // returns save_1
		ini_open(savefile);
		global.moonOpen = ini_read_real(saveSection, "save_moon", 0);
		ini_close();
}

function load_roomScraps(){
	// search the room and destroy any IDs that show up in the save file
	var num_scraps = instance_number(oScrap);
	var scrapsSection = "save_" + string(global.saveslot) + "_scraps"; // returns save_1
	ini_open(savefile);
	for (var i = 0; i < num_scraps; i++){
			var thisScrap = instance_find(oScrap,i);
			if ini_key_exists(scrapsSection,thisScrap){
				with thisScrap marked_for_death = true;
			}
	}
	ini_close();
}