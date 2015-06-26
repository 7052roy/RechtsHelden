package ;

/**
 * This class sets the states of the entities in the game
 * 
 * @author Roy Leinenga
 * @author Luuk Huizing
 */
class FSM
{
	public var activeState(null, default):Void->Void;
	
	/**
	 * function that sets the initial state of the entity
	 * 
	 * @param	InitState
	 */
	public function new(?InitState:Void->Void):Void
	{
		activeState = InitState;
	}
	
	/**
	 * function that is called every frame
	 */
	public function update():Void
	{
		if (activeState != null)
			activeState();
	}
}