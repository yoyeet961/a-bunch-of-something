-- name: a bunch of something
-- description: this is a bunch of random stuff in one mod, i hope you like it.\n\nsay /act99 to go to act 99 of your current level.\nsay /act0 to go to act 0 of your current level.\n\nsay /pc to warp to "Peach's Castle".\n\nmade by watchr/defacube

--replaces castle music with wrinkly 64 which is sometimes used in beta hacks idk.\n\nbtw i know you stole this from the tmp folder cuz this mod is private for no actual reason lmfao

-- function warp()
-- if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 6) then
--     stop_background_music(4)
-- else
--     smlua_audio_utils_replace_sequence(0x04, 0x0E, 75, "04_Seq_custom")
-- end
---@param o Object
--LEVEL_HOLY_YELLOW_SWITCH_PALACE = level_register("level_holy_yellow_switch_palace_entry", COURSE_NONE, "Holy Yellow Switch Palace", "palace", 20000, 0x28, 0x28, 0x28)
local nearLObject = false
local closetoLObject = true
function lies_init(o)
        o.oFlags = (OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO)
        -- gGlobalSyncTable.liesObject = o
end
---@param o Object
function lies_loop(o)
        obj_set_billboard(o)
        if (dist_between_objects(o, gMarioStates[0].marioObj)) <= 2000 then
                nearLObject = true
        else
                nearLObject = false
        end
        if (dist_between_objects(o, gMarioStates[0].marioObj)) <= 600 then
                closetoLObject = true
        else
                closetoLObject = false
        end
        if (dist_between_objects(o, gMarioStates[0].marioObj)) <= 400 then
                warp_to_level(26, 1, 99)
        end
end
id_bhvLies = hook_behavior(nil, OBJ_LIST_LEVEL, true, lies_init, lies_loop, "Lies")
smlua_audio_utils_replace_sequence(0x23, 0x0E, 75, "35_Seq_custom")
local timer = 0
---@param m MarioState
function mario_update(m)
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == LEVEL_PSS) then
                if m.actionTimer >= 600 then
                        m.health = 0xFF
                end
        end
end
hook_event(HOOK_MARIO_UPDATE, mario_update)
function onhudrender()
        if nearLObject == true and (gNetworkPlayers[0].currLevelNum == LEVEL_FAKE_LLL) then
                djui_hud_set_font(FONT_HUD)
                djui_hud_set_resolution(RESOLUTION_DJUI)
                local scale = 4
                local width = djui_hud_measure_text("IT IS NOT REAL") * scale
                local x = (djui_hud_get_screen_width() - width) * 0.5
                local randval = math.random(0,1)
                local height = djui_hud_get_screen_height()
                if randval == 0 then
                        djui_hud_print_text("IT IS NOT REAL", x,height/2, scale)
                end
        end
        if nearLObject == true and (gNetworkPlayers[0].currLevelNum == LEVEL_CCH) then
                djui_hud_set_font(FONT_HUD)
                djui_hud_set_resolution(RESOLUTION_DJUI)
                local scale = 4
                local width = djui_hud_measure_text("DO NOT DELIVER THE PENGUIN") * scale
                local x = (djui_hud_get_screen_width() - width) * 0.5
                local randval = math.random(0,1)
                local height = djui_hud_get_screen_height()
                if randval == 0 then
                        djui_hud_print_text("DO NOT DELIVER THE PENGUIN", x,height/2, scale)
                end
                if gMarioStates[0].action == ACT_HOLD_IDLE or gMarioStates[0].action == ACT_HOLD_JUMP or gMarioStates[0].action == ACT_HOLD_JUMP_LAND or gMarioStates[0].action == ACT_HOLD_WALKING or gMarioStates[0].action == ACT_HOLD_BUTT_SLIDE or gMarioStates[0].action == ACT_HOLD_BUTT_SLIDE_AIR then
                        warp_to_warpnode(LEVEL_WDW, 2, 99, 241)
                end
        end
        if nearLObject == true and (gNetworkPlayers[0].currLevelNum == LEVEL_DDW) then
                djui_hud_set_font(FONT_HUD)
                djui_hud_set_resolution(RESOLUTION_DJUI)
                local scale = 4
                local width = djui_hud_measure_text("GO BACK") * scale
                local width2 = djui_hud_measure_text("IT IS NOT REAL") * scale
                local x = (djui_hud_get_screen_width() - width) * 0.5
                local x2 = (djui_hud_get_screen_width() - width2) * 0.5
                local randval = math.random(0,3)
                local height = djui_hud_get_screen_height()
                if randval == 0 then
                        djui_hud_print_text("GO BACK", x,height/2, scale)
                end
                if randval == 2 then
                        djui_hud_print_text("IT IS NOT REAL", x2,height/2, scale)
                end
        end
        if closetoLObject == true and (gNetworkPlayers[0].currLevelNum == LEVEL_DDW) and gMarioStates[0].action == ACT_JUMP then
                warp_to_warpnode(6, 1, 99, 31)
                play_sound(SOUND_MARIO_WAAAOOOW, gMarioStates[0].pos)
        end
end
hook_event(HOOK_ON_HUD_RENDER, onhudrender)
-- end
-- hook_event(HOOK_ON_WARP, warp)
-- function warp()
--     if not (gNetworkPlayers[0].currLevelNum == 6) then
--         audio_stream_stop(forestmaze)
--     end
-- end
-- hook_event(HOOK_ON_WARP, warp)
-- function idk()
--     if gNetworkPlayers[0].currActNum == 99 then
--         smlua_audio_utils_replace_sequence(0x04, 0x0E, 75, "35_Seq_custom")
--     else
        smlua_audio_utils_replace_sequence(0x04, 19, 75, "04_Seq_custom")
--     end
-- end
-- hook_event(HOOK_ON_WARP, idk)
smlua_audio_utils_replace_sequence(36, 0x0E, 75, "crescentcastle")
smlua_audio_utils_replace_sequence(37, 34, 75, "fieldofbombs")
smlua_audio_utils_replace_sequence(38, 0x0E, 75, "slowcastle")
smlua_audio_utils_replace_sequence(39, 0x0E, 75, "castle")
smlua_audio_utils_replace_sequence(40, 34, 75, "BATTLEFIELD")
smlua_audio_utils_replace_sequence(41, 17, 75, "wec")
smlua_audio_utils_replace_sequence(42, 19, 75, "invertedcg")
smlua_audio_utils_replace_sequence(43, 37, 75, "funnymaze")
smlua_audio_utils_replace_sequence(44, 13, 75, "slidee")
smlua_audio_utils_replace_sequence(45, 19, 75, "minorminordocks")
smlua_audio_utils_replace_sequence(46, 11, 75, "coldcoldhill")
LEVEL_EERIEGROUNDS = level_register("level_eeriegrounds_entry", COURSE_NONE, "Eeriegrounds", "eg", 28000, 40, 40, 40)
LEVEL_WEIRDYARD = level_register("level_weirdyard_entry", COURSE_NONE, "castle_courtyard", "wc", 28000, 40, 40, 40)
LEVEL_BOB_Z64 = level_register("level_bob_z64_entry", COURSE_NONE, "bob.z64", "bz64", 28000, 0x28, 0x28, 0x28)
LEVEL_FAKE_GROUNDS = level_register("level_fake_grounds_entry", COURSE_NONE, "castle_grounds", "wg", 28000, 0x28, 0x28, 0x28)
LEVEL_FAKE_LLL = level_register("level_fake_lll_entry", COURSE_NONE, "LETHAL LAVA PURGATORY", "llp", 20000, 0x28, 0x28, 0x28)
LEVEL_CCH = level_register("level_cch_entry", COURSE_NONE, "Cold, Cold Hill", "cch", 20000, 0x28, 0x28, 0x28)
LEVEL_DDW = level_register("level_ddw_entry", COURSE_NONE, "Dry, Dry World", "ddw", 20000, 0x28, 0x28, 0x28)
--smlua_text_utils_course_acts_replace(LEVEL_SA, "CASTLEGROUNDS", "SEEK", "n", "I AM WATCHING", "HAHAHAHAHAHAHAHAHA", "DDDDDDDD", "GBGBGBGBGBGBGBGBGBGBGB")
--smlua_text_utils_course_acts_replace(LEVEL_ENDING, "CASTLE", "SEEK", "n", "I AM WATCHING", "HAHAHAHAHAHAHAHAHA", "DDDDDDDD", "GBGBGBGBGBGBGBGBGBGBGB")
function warp()
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 6) then
                stop_background_music(4)
                play_music(0, 36, 1)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 9) then
                stop_background_music(2)
                play_music(0, 37, 1)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 24) then
                stop_background_music(2)
                play_music(0, 41, 1)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 5) then
                stop_background_music(SEQ_LEVEL_SNOW)
                -- for penguin in pairs(cur_obj_find_nearest_object_with_behavior(id_bhvPenguinBaby, 5000)) do
                --         cur_obj_disable_rendering_and_become_intangible(penguin)
                -- end
                --set_override_skybox(11)
                play_music(0, 43, 1)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 11) then
                stop_background_music(12)
                play_music(0, 42, 1)
                --local red_star = get_texture_info("red_star_0")
                set_override_skybox(45)
                if gMarioStates[0].playerIndex == 0 then
                        play_sound(SOUND_GENERAL_PAINTING_EJECT, gMarioStates[0].pos)
                end
                -- for obj in pairs(cur_obj_find_) do
                        
                -- end
        else
                set_override_skybox(get_skybox())
        end
        --//if gNetworkPlayers[0].currLevelNum == 11 and (gNetworkPlayers[0].currActNum ~= 99) then
               -- set_override_skybox(BACKGROUND_UNDERWATER_CITY)
        --end
        if gNetworkPlayers[0].currActNum == 3215 and (gNetworkPlayers[0].currLevelNum == 24) then
                warp_to_level(20, 1, 0)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == LEVEL_PSS) then
                stop_background_music(SEQ_LEVEL_SLIDE)
                play_music(0, 44, 1)
        end
        if gNetworkPlayers[0].currActNum == 99 and (gNetworkPlayers[0].currLevelNum == 23) then
                stop_background_music(SEQ_LEVEL_WATER)
                play_music(0, 45, 1)
        end
        if gNetworkPlayers[0].currLevelNum == LEVEL_FAKE_LLL then
                spawn_non_sync_object(id_bhvLies, E_MODEL_STAR, 3112, 521, 7966, nil)
        end
        if gNetworkPlayers[0].currLevelNum == LEVEL_CCH then
                play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].pos)
                spawn_non_sync_object(id_bhvLies, E_MODEL_STAR, 3515, -4517, 4597, nil)
        end
        if gNetworkPlayers[0].currLevelNum == LEVEL_DDW then
                spawn_non_sync_object(id_bhvLies, E_MODEL_STAR, -778, -2056, 730, nil)
        end
end
function deleteObjects(o)
        if gNetworkPlayers[0].currLevelNum == 5 and (gNetworkPlayers[0].currActNum == 99) then
                if not get_id_from_behavior(o.behavior) == id_bhvMario then
                        o.activeFlags = ACTIVE_FLAG_DEACTIVATED
                else
                        return o
                end
        end
end
function act99(msg)
        warp_to_level(gNetworkPlayers[0].currLevelNum, gNetworkPlayers[0].currAreaIndex, 99)
        return true
end
function act0(msg)
        warp_to_level(gNetworkPlayers[0].currLevelNum, gNetworkPlayers[0].currAreaIndex, 0)
        return true
end
function pc(msg)
        warp_to_level(25,1,0)
        return true
end
function eeriegrounds(msg)
        warp_to_level(LEVEL_EERIEGROUNDS,1,0)
        return true
end
function weirdyard(msg)
        warp_to_level(LEVEL_WEIRDYARD,1,0)
        return true
end
function bobz64(msg)
        warp_to_level(LEVEL_BOB_Z64,1,0)
        return true
end
function fakegrounds(msg)
        warp_to_level(LEVEL_FAKE_GROUNDS,1,0)
        return true
end
function lethal_lava_purgatory(msg)
        warp_to_level(LEVEL_FAKE_LLL,1,0)
        return true
end
function cch(msg)
        warp_to_level(LEVEL_CCH,1,0)
        return true
end
function ddw(msg)
        warp_to_level(LEVEL_DDW,1,0)
        return true
end
function castlegrounds(msg)
        warp_to_level(16,1,0)
        return true
end
hook_chat_command("act99", "No arguments required", act99)
hook_chat_command("act0", "No arguments required", act0)
hook_chat_command("pc", "No arguments required", pc)
hook_chat_command("eeriegrounds", "No arguments required", eeriegrounds)
hook_chat_command("weirdyard", "No arguments required", weirdyard)
hook_chat_command("bob.z64", "No arguments required", bobz64)
hook_chat_command("fakegrounds", "No arguments required", fakegrounds)
hook_chat_command("llp", "No arguments required", lethal_lava_purgatory)
hook_chat_command("cch", "No arguments required", cch)
hook_chat_command("ddw", "No arguments required", ddw)
hook_chat_command("castlegrounds", "No arguments required", castlegrounds)
hook_event(HOOK_OBJECT_SET_MODEL, deleteObjects)
hook_event(HOOK_ON_WARP, warp)