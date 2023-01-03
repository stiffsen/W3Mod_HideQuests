Hide Quests - 1.0

On my second playthrough, I hated how so many quests that I don't intend to complete cluttered up my quest log. So I developed this little mod that let's you hide and unhide quests in your journal. This is my first mod for Witcher 3, so it is a little rough around the edges.


:: REQUIREMENTS ::

- Witcher 3 4.0 (NGE)


:: FEATURES ::

- Hide/Unhide quests in the quest journal
- Sort quests by level in descending order (except finished and aborted quests)


:: LOCALIZATION ::

If strings for your language are missing, please go to the localization sub-folder and provide them. Instructions can be found there.


:: INSTALLATION USING MODMANAGER ::

- Add the downloaded archive via ModManager
- ScriptMerger to resolve any conflicts with other mods. 
  - If there is a conflict in the file hideQuestsAPI.ws, always use the file provided by this mod, overwriting the existing one. (This is a conflict by design!)
- Optional: Change default input binding for action "ToggleHideQuest" in your [Documents]\The Witcher 3\input.settings in the section [EMPTY_CONTEXT].


:: INSTALLATION USING VORTEX IS NOT SUPPORTED ::

Automatic installation via Vortex does not work because Vortex tries to merge a shipped XML file (which is wrong) and interprets the encoding incorrectly (which is why it shows very cryptic symbols in the error message). Multiple mods are affected by this issue, including FriendlyHUD and Preparations. Some people have tried to install this mod manually (described below) and register with Vortex afterwards, but this also yielded no satisfactory results. Therefore, this mod is sadly incompatible with Vortex. If you want to use this mod, I suggest installing TW3MM﻿. (Don't forget to backup your "[Documents]\The Witcher 3" folder before deactivating Witcher 3 in Vortex.)


:: MANUAL INSTALLATION ::

- Copy modHideQuests to your [Witcher 3]/mods directory.
- Execute ScriptMerger to resolve any conflicts.
- Append contents of input.settings.part.txt to your [Documents]\The Witcher 3\input.settings.
- Optional: Change default input binding for action "ToggleHideQuest" in your [Documents]\The Witcher 3\input.settings in the section [EMPTY_CONTEXT].


:: KNOWN ISSUES ::

Quests will only be hidden/unhidden after reopening the quest journal.


:: USAGE ::

Hiding
- In the quest journal, select a quest and press the button that is bound to the action "ToggleHideQuest" (default: X/Triangle on your pad, or H on keyboard).
- A small popup will show indicating that the quest is now marked as hidden.
- If you close and reopen the quest journal, the quest will now show in the drop-down category called "hidden".

Unhiding
- Select the previously hidden quest in the "hidden" category and press the button for "ToggleHideQuest" to unhide the quest. 
- A small popup will show indicating that the quest is now marked as not-hidden.
- If you close and reopen the quest journal, the quest will now show in its original dropdown category, rather than under "hidden".


:: INFORMATION FOR MODDERS ::

If you want to use the "Hide Quests" functionality in your mod as well, you can find an API definition under:
	modHideQuests\API\content\scripts\hidequests\hideQuestsAPI.ws
This file contains dummy implementations of the required functions that are actually implemented by this mod. Just copy the content folder to your mod directory and use the defined functions. You should instruct your users to always let Script Merger use the complete hideQuestsAPI.ws of "Hide Quests" or have "Hide Quests" load before your mod and skip the merging.


:: CREDITS ::

- Wasteland Ghost for answering various questions about modding
- daibhid for "Quest Sorting"