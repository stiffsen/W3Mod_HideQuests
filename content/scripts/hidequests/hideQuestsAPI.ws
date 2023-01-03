// ---=== modHideQuests start ===---	


/* Check if a quest is hidden
 *
 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
 * @returns true, if quest is hidden, false, otherwise
 */
function modHideQuests_IsQuestHidden( questTitleStringId : int ) : bool
{
	return modHideQuests_FindHiddenQuest(questTitleStringId) >= 0;
}


/* Toggle hidden-state of a quest
 *
 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
 */
function modHideQuests_ToggleQuestHidden( questTitleStringId : int )
{
	var idxHidden     : int;		
	var logmessage    : string;
	var playerWitcher : W3PlayerWitcher = GetWitcherPlayer();
	
	idxHidden = modHideQuests_FindHiddenQuest(questTitleStringId);
	
	if (idxHidden >= 0)
	{
		LogChannel('modHideQuests', "Unhiding: " + IntToString(questTitleStringId));
		playerWitcher.hiddenQuests.Erase(idxHidden);
		logmessage = GetLocStringByKeyExt("panel_journal_statuschange_visible") + GetLocStringById( questTitleStringId );
	}
	else
	{
		LogChannel('modHideQuests', "Hiding: " + IntToString(questTitleStringId));
		playerWitcher.hiddenQuests.PushBack(questTitleStringId);
		logmessage = GetLocStringByKeyExt("panel_journal_statuschange_hidden") + GetLocStringById( questTitleStringId );
	}
	
	theGame.GetGuiManager().ShowNotification( logmessage, , true );
}


/* Retrieve the quest title string id from a map pin instance
 *
 * @param   pin  A map pin instance
 * @returns -1 if quest is not valid, otherwise, the quest title string id
 */
function modHideQuests_GetQuestTitleStringIdFromMapPinInstance( pin : SCommonMapPinInstance ) : int
{
	var journalManager : CWitcherJournalManager = theGame.GetJournalManager();
	var curObjective   : CJournalQuestObjective;
	var curQuest       : CJournalQuest;
	
	curObjective = (CJournalQuestObjective)journalManager.GetEntryByGuid( pin.guid );
	if( curObjective )
		curQuest = curObjective.GetParentQuest();
	
	if ( curQuest )
		return curQuest.GetTitleStringId();

	return -1;
}


/* Check if a quest associated to a map pin is hidden
 *
 * @param   pin  A map pin instance
 * @returns true, if quest is hidden, false, otherwise
 */
function modHideQuests_IsMapPinHidden( pin : SCommonMapPinInstance ) : bool
{
	var questTitleStringId : int = modHideQuests_GetQuestTitleStringIdFromMapPinInstance( pin );	
	if ( questTitleStringId == -1 )
		return false;
		
	return modHideQuests_IsQuestHidden( questTitleStringId );	
}


/* Toggle hidden-state of a quest associated to map pin
 *
 * @param   pin  A map pin instance
 */
function modHideQuests_ToggleMapPinHidden( pin : SCommonMapPinInstance )
{
	var questTitleStringId : int = modHideQuests_GetQuestTitleStringIdFromMapPinInstance( pin );	
	if ( questTitleStringId == -1 )
		return;
		
	modHideQuests_ToggleQuestHidden( questTitleStringId );	
}

// ---=== modHideQuests end ===---	