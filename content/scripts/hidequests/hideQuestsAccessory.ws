// ---=== modHideQuests start ===---	


/* Check if a quest is hidden and return its local index
 *
 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
 * @returns -1, if quest is not hidden, otherwise, the index of the quest in the array of hidden quests (GetWitcherPlayer().hiddenQuests)
 */
function modHideQuests_FindHiddenQuest( questTitleStringId : int ) : int
{
	var i             : int;
	var playerWitcher : W3PlayerWitcher = GetWitcherPlayer();

	if ( playerWitcher.hiddenQuests.Size() == 0 )
	{
		return -1;
	}
	
	for ( i = 0; i < playerWitcher.hiddenQuests.Size(); i+= 1 )
	{
		if (playerWitcher.hiddenQuests[i] == questTitleStringId)
		{
			return i;
		}
	}
	
	return -1;
}


// ---=== modHideQuests end ===---	