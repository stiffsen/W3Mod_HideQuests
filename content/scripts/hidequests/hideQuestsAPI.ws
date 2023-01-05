// ---=== modHideQuests start ===---	


statemachine class HideQuestsAPI
{

	/* Check if a quest is hidden
	 *
	 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
	 * @returns true, if quest is hidden, false, otherwise
	 */
	public function IsQuestHidden(questTitleStringId: int) : bool
	{
		var currentState : HideQuestsAPIStateDummy;
		Init();
		currentState = (HideQuestsAPIStateDummy)GetCurrentState();
		return currentState.IsQuestHidden(questTitleStringId);
	}
	
	
	/* Toggle hidden-state of a quest
	 *
	 * @param   questTitleStringId  The titleStringId identifying the quest. (Obtained via CJournalQuest::GetTitleStringId())
	 */
	public function ToggleQuestHidden(questTitleStringId: int )
	{
		var currentState : HideQuestsAPIStateDummy;
		Init();
		currentState = (HideQuestsAPIStateDummy)GetCurrentState();
		return currentState.ToggleQuestHidden(questTitleStringId);
	}
	
	
	/* Retrieve the quest title string id from a map pin instance
	 *
	 * @param   pin  A map pin instance
	 * @returns -1 if quest is not valid, otherwise, the quest title string id
	 */
	public function GetQuestTitleStringIdFromMapPinInstance(pin: SCommonMapPinInstance ) : int
	{
		var journalManager : CWitcherJournalManager = theGame.GetJournalManager();
		var curObjective   : CJournalQuestObjective;
		var curQuest       : CJournalQuest;
		
		curObjective = (CJournalQuestObjective)journalManager.GetEntryByGuid(pin.guid);
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
	public function IsMapPinHidden(pin: SCommonMapPinInstance ) : bool
	{
		var questTitleStringId : int = GetQuestTitleStringIdFromMapPinInstance(pin);	
		if ( questTitleStringId == -1 )
			return false;
			
		return IsQuestHidden(questTitleStringId);	
	}


	/* Toggle hidden-state of a quest associated to map pin
	 *
	 * @param   pin  A map pin instance
	 */
	public function ToggleMapPinHidden(pin : SCommonMapPinInstance )
	{
		var questTitleStringId : int = GetQuestTitleStringIdFromMapPinInstance(pin);	
		if ( questTitleStringId == -1 )
			return;
			
		ToggleQuestHidden(questTitleStringId);	
	}
	
	
	
	
	private function Init()
	{
		GotoState('Dummy');
		GotoState('Impl');
	}
}

state Dummy in HideQuestsAPI
{
	public function IsQuestHidden(questTitleStringId: int) : bool
	{
		LogChannel('HidequestsAPI', "Dummy: IsQuestHidden");
		return false;
	}
	
	public function ToggleQuestHidden(questTitleStringId: int)
	{
		LogChannel('HidequestsAPI', "Dummy: ToggleQuestHidden");
	}
}

// ---=== modHideQuests end ===---	