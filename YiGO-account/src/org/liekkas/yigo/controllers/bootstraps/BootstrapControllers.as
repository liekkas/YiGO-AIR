package org.liekkas.yigo.controllers.bootstraps
{
	
	import org.liekkas.yigo.controllers.cmds.LoginSuccessCMD;
	import org.liekkas.yigo.controllers.cmds.StartupCompleteCMD;
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.ICommandMap;

	/*************************************************************\
	 * 控制类映射关系
	 *
	 * @author liekkas.zeng
	 * @since  2012.03.09
	\*************************************************************/
	public class BootstrapControllers
	{
		public function BootstrapControllers(commandMap:ICommandMap)
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCMD, ContextEvent  , true);
			commandMap.mapEvent(AppEvent.LOGIN_SUCCESS,LoginSuccessCMD,AppEvent,true);
		}
	}
}