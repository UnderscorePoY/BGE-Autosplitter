
// TODO : fix slowdown when doing Early Beluga

// time : IGT with slowdowns
//			* Keeps going when resetting a game
//			* Undergoes slowdowns even when dying
//			* Stops during loading screens
// timeFromNewGame : IGT from New Game
//			* Equals 0 when hitting New Game
//          * Stops when dying
//			* Steps back after dying
//			# only used to start the timer
// map : name of the current map
//			* main menu name is "_main_logo"
// isCutscenePlayingInBossRoom : a flag that indicates if a cutscene is playing in boss room
//          * 1 if a cutscene is playing

//state("BGE","UPlay")
//{
//	float timeFromNewGame : 0x00733EAC, 0x2A8; // http://y.zxq.co/uvamhp.png from Piorrro33
//	float time : 0x002CEBFD, 0x0; // same as Steam_NoPatch
//	string50 map : 0x00730CE4, 0x1D4;
//}
//
//state("BGE","Steam_NoPatch")
//{
//	float timeFromNewGame : 0x007880C8, 0x0; 
//	float time : 0x002CEBFD, 0x0;
//	string50 map : 0x00789DA8;
//}

state("BGE","CD_Polish")
{
	float timeFromNewGame : 0x00784A48, 0x0;
	float time : 0x007912A0; // timeSinceBoot
	string50 map : 0x00790FE8;
    int isCutscenePlayingInBossRoom : 0x007851E0, 0x0;
}

startup
{
	refreshRate = 60;
    
	//----------------------------------------------//
	settings.Add("any%", true, "Any%");
	settings.Add("other", false, "Other");
	
	settings.CurrentDefaultParent = "any%";
	settings.Add("intro", false, "Intro");
	settings.Add("lighthouse", true, "Lighthouse");
	settings.Add("early_beluga", true, "Early Beluga");
	settings.Add("pterolimax", false, "Pterolimax (Black Isle Boss)");
	settings.Add("black_isle", true, "Black Isle (after clearing the area)");
	settings.Add("spirit_reaper", true, "Spirit Reaper (after exiting the room)");
	settings.Add("nutripils_factory", true, "Nutripils Factory");
	settings.Add("to_the_moon", true, "To The Moon");
	settings.Add("moon_hacking", false, "Moon Transmitter Hacking");
	settings.Add("alpha_spider", true, "Alpha Spider");
	settings.Add("domz_priest", true, "DomZ Priest");
	
	settings.CurrentDefaultParent = "other";
	settings.Add("evidence_1", false, "Slaughterhouses Evidence 1 (horizontal elevator)");
	settings.Add("evidence_2", false, "Slaughterhouses Evidence 2 (horizontal elevator)");
	settings.Add("evidence_3", false, "Slaughterhouses Evidence 3");
	settings.Add("looter_1", false, "Looter's Cavern 1");
	settings.Add("looter_2", false, "Looter's Cavern 2");
	settings.Add("looter_3", false, "Looter's Cavern 3");
	settings.Add("looter_4", false, "Looter's Cavern 4");
	settings.Add("race_1", false, "Race 1");
	settings.Add("race_2", false, "Race 2");
	settings.Add("race_3", false, "Race 3");
	settings.Add("race_4", false, "Race 4");
	settings.Add("races_1_2", false, "Races 1 & 2");
	settings.Add("races_3_4", false, "Races 3 & 4");
	settings.Add("square_key_quarters", false, "Alpha Section Und. Quarters (Square Key)");
	settings.Add("volcano_treasure", false, "Volcano's Treasure");
	settings.Add("vorax_lair", false, "Vorax's Lair");
	//----------------------------------------------//
		
	vars.GetSplitList = (Func<Dictionary<string, KeyValuePair<string, string>>>)(() =>
	{
		return new Dictionary<string, KeyValuePair<string, string>>
		{
			{"intro", new KeyValuePair<string, string>("00_03_dehors_maison_Intro", "00_03_dehors_maison_Waf")},
			{"lighthouse", new KeyValuePair<string, string>("00_01_home_sas_hangar", "04_00_vaisseau_hyllis_planete")},
			{"early_beluga", new KeyValuePair<string, string>("06_12_animaux_garage", "04_00_vaisseau_hyllis_planete")},
			{"pterolimax", new KeyValuePair<string, string>("05_02_ilot_boss", "05_00_ilot_sas_accueil")},
			{"black_isle", new KeyValuePair<string, string>("05_00_ilot_sas_accueil", "04_00_vaisseau_hyllis_planete")},
			{"spirit_reaper", new KeyValuePair<string, string>("01_01_entrepot_ascenseur_central", "01_02_entrepot_salle_fusibles")},
			{"nutripils_factory", new KeyValuePair<string, string>("01_00_entrepot_sas_entree", "04_00_vaisseau_hyllis_planete")},
			{"to_the_moon", new KeyValuePair<string, string>("04_00_vaisseau_hyllis_planete", "04_01_vaisseau_hyllis_espace")},
			{"moon_hacking", new KeyValuePair<string, string>("08_03_satellite_emetteur", "06_00_Animaux_quartier_pietons_revolution")},
			{"alpha_spider", new KeyValuePair<string, string>("04_02_vaisseau_lune", "09_01_nazh_boss")},
			{"domz_priest", new KeyValuePair<string, string>("09_01_nazh_boss", "09_01_nazh_boss_cine_finale")}, // the split is performed before map transition
			
			{"evidence_1", new KeyValuePair<string, string>("03_07_egouts_abattoir_interieur", "03_05_egouts_cyclope_derriere")},
			{"evidence_2", new KeyValuePair<string, string>("03_07_egouts_abattoir_interieur", "03_15_egouts_stealth_02")},
			{"evidence_3", new KeyValuePair<string, string>("03_07_egouts_abattoir_interieur", "03_14_egouts_stealth_01")},
			{"looter_1", new KeyValuePair<string, string>("11_00_vieux_fou_01", "04_00_vaisseau_hyllis_planete")},
			{"looter_2", new KeyValuePair<string, string>("11_01_vieux_fou_02", "04_00_vaisseau_hyllis_planete")},
			{"looter_3", new KeyValuePair<string, string>("11_02_vieux_fou_03", "04_00_vaisseau_hyllis_planete")},
			{"looter_4", new KeyValuePair<string, string>("11_03_vieux_fou_04", "04_00_vaisseau_hyllis_planete")},
			{"race_2", new KeyValuePair<string, string>("07_02_course_02", "07_00_course_00")},
			{"race_4", new KeyValuePair<string, string>("07_04_course_04", "07_03_course_03")},
			{"races_1_2", new KeyValuePair<string, string>("07_00_course_00", "06_00_Animaux_Canaux")},
			{"races_3_4", new KeyValuePair<string, string>("", "04_00_vaisseau_hyllis_planete")},
			//{"slaughterhouses_entrance", new KeyValuePair<string, string>("", "04_00_vaisseau_hyllis_planete")},
			{"square_key_quarters", new KeyValuePair<string, string>("11_10_Combat_03", "04_00_vaisseau_hyllis_planete")},
			{"volcano_treasure", new KeyValuePair<string, string>("11_13_Combat_06", "04_00_vaisseau_hyllis_planete")},
			{"vorax_lair", new KeyValuePair<string, string>("11_08_Combat_01", "04_00_vaisseau_hyllis_planete")},
			
		};
	});
    
	//vars.startedNewGameTime = 0f; // Stores current total time spent in the game to use as an offset
    vars.startOffset = 0f; // Depends how the player restarts the game
    vars.totalLoadTime = 0f; // How much loading we went through
    //vars.backtracktime = 0f; // How much backtracking from deaths
    vars.lastLoadStartTimestamp = null; // Timestamp when last loading started
	vars.mammago = 0; // Trick variable for Mammago Garage split
    vars.finalBossCutscenesLeft = 0; // Counts the numbers of cutscenes left before the boss is beaten
    vars.end_delay = 0f; // How long to wait after boss cutscene starts in order to stop the timer
    vars.splits = null; // List of splits
    
    vars.Init = (Action<string>)((string oldMap) => 
    {
        // Sets a LiveSplit offset depending on where New Game is triggered from
        if(oldMap.Contains("_main_logo"))
            vars.startOffset = 0.583; //0.533;
        else if(oldMap.Contains("dehors_maison_Intro"))
            vars.startOffset = 0.166;
        else
            vars.startOffset = 0.333;
        timer.Run.Offset = TimeSpan.FromSeconds(vars.startOffset);
        
        vars.totalLoadTime = 0f;
        //vars.backtracktime = 0f;
        vars.lastLoadStartTimestamp = null;
        vars.mammago = 1;
        vars.finalBossCutscenesLeft = 3;
        vars.end_delay = 3.076;
        vars.splits = vars.GetSplitList();
    });
    
    vars.IsStart = (Func<float, double, string, bool>)((float refTime, double fps, string refMap) => 
    {
        return refTime < 4f/fps && refMap.Contains("dehors_maison_Intro");
    });
}

init
{
	print("[BGE/init] ModuleMemorySize: "+modules.First().ModuleMemorySize);
	
	switch(modules.First().ModuleMemorySize){
		//case 9457664 : version = "UPlay";
		//			   break;
		//case 9768960 : version = "Steam_NoPatch";
		//			   break;
		case 9850880 : version = "CD"; // Was tested with Polish patch only
					   break;
		default : version = "unknown";
				  break;
	}
	
	//if(version == "unknown")
	//	throw new Exception("Non-supported version of BGE.");
}

update
{	
    if(version == "unknown")
        return false;

    // Only stop updating if a run hasn't started. This should fix reset.
    //if(vars.totalLoadTime == 0)
    //{
        // User is in introduction/main menus
        switch((string)current.map){
            case "" :
            case "_main_fix":
            case "_main_logo":
            case "_main_credits":
            case "logo":
            case "_SFX_light&smoke":
                return false;
            default : break;
        }
    //}
    
    
    // Handling loading time
    if(current.time == old.time && vars.lastLoadStartTimestamp == null)
        vars.lastLoadStartTimestamp = timer.CurrentTime.RealTime.Value;
    if(current.time > old.time && vars.lastLoadStartTimestamp != null)
    {
        vars.totalLoadTime += (timer.CurrentTime.RealTime.Value - vars.lastLoadStartTimestamp).TotalSeconds;
        vars.lastLoadStartTimestamp = null;
        print("[BGE/update] totalLoadTime: "+vars.totalLoadTime);
    }
    //print("[BGE/update] "+current.time+" "+old.time+" "+refreshRate+" "+vars.totalLoadTime);

	return true;
}

start
{
    //print("[BGE/start] "+current.timeFromNewGame+" "+(string)current.map);;
	if (vars.IsStart(current.timeFromNewGame, refreshRate, (string)current.map))
    {
        vars.Init((string)old.map);
        print("[BGE/start] Offset: "+timer.Run.Offset);
		return true;
	}
	
	return false;
}

isLoading
{
    // No gametime interpolation
    return true;
}


gameTime
{
    var time = (current.time == old.time) ? vars.lastLoadStartTimestamp.TotalSeconds : timer.CurrentTime.RealTime.Value.TotalSeconds;
	return TimeSpan.FromSeconds(time - vars.startOffset - vars.totalLoadTime);
}


split
{
    if(vars.splits == null)
        return false;
    
	foreach(var _split in vars.splits)
	{	
		if(settings[_split.Key])
		{
			var _pair = _split.Value;
			if(((string)old.map).Contains(_pair.Key) && ((string)current.map).Contains(_pair.Value))
			{
				if(_split.Key == "early_beluga" && vars.mammago > 0)
					--vars.mammago;
                else if(_split.Key == "domz_priest")
                {
                    /* don't split, delay handled below */
                }
                else // Classic split on map transition
				{
					vars.splits.Remove(_split.Key);
					return true;
				}
			}
            
            if(_split.Key == "domz_priest" && ((string)current.map).Contains("09_01_nazh_boss"))
            {
                // Cutscene triggered ?
                if(current.isCutscenePlayingInBossRoom - old.isCutscenePlayingInBossRoom == 1)
                    --vars.finalBossCutscenesLeft;
                
                // Has died after mind control ?
                if(vars.finalBossCutscenesLeft == 1 && current.timeFromNewGame < old.timeFromNewGame)
                    ++vars.finalBossCutscenesLeft;
                
                // Final cutscene ?
                if(vars.finalBossCutscenesLeft <= 0)
                {
                    // Waiting for final hit
                    vars.end_delay -= (current.time - old.time);
                    if(vars.end_delay <= 0)
                    {
                        vars.splits.Remove(_split.Key);
                        return true;
                    }
                }
            }
		}
	}
}

reset
{
    
    //print("[BGE/reset] "+current.timeFromNewGame+" "+timer.CurrentTime.RealTime.Value.TotalSeconds+" "+(string)current.map);
    if(timer.CurrentTime.RealTime.Value.TotalSeconds > 5f
        && vars.IsStart(current.timeFromNewGame, refreshRate, (string)current.map))
    {
        vars.Init((string)old.map);
        print("[BGE/start] Offset: "+timer.Run.Offset);
		return true;
	}
    
    return false;
}

exit
{
}

shutdown
{
}
