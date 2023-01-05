// ---=== modHideQuests start ===---	



state Impl in HideQuestsAPI extends Dummy
{
	/* Check if a quest is hidden and return its local index
	 *
	 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
	 * @returns -1, if quest is not hidden, otherwise, the index of the quest in the array of hidden quests (GetWitcherPlayer().hiddenQuests)
	 */
	private function FindHiddenQuest(questTitleStringId: int ) : int
	{
		var i             : int;
		var playerWitcher : W3PlayerWitcher = GetWitcherPlayer();

		if (playerWitcher.hiddenQuests.Size() == 0)
		{
			return -1;
		}
		
		for (i = 0; i < playerWitcher.hiddenQuests.Size(); i += 1)
		{
			if (playerWitcher.hiddenQuests[i] == questTitleStringId)
			{
				return i;
			}
		}
		
		return -1;
	}
	
	public function IsQuestHidden(questTitleStringId: int) : bool
	{
		LogChannel('HidequestsAPI', "Impl: IsQuestHidden");
		return FindHiddenQuest(questTitleStringId) >= 0;
	}
	
	public function ToggleQuestHidden(questTitleStringId: int)
	{
		var idxHidden     : int;		
		var logmessage    : string;
		var playerWitcher : W3PlayerWitcher = GetWitcherPlayer();
		
		idxHidden = FindHiddenQuest(questTitleStringId);
		
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
}





// ---=== modHideQuests end ===---	