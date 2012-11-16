package org.liekkas.yigo
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import org.liekkas.yigo.controllers.bootstraps.BootstrapModels;
	import org.liekkas.yigo.controllers.bootstraps.BootstrapServices;
	import org.liekkas.yigo.controllers.bootstraps.BootstrapControllers;
	import org.liekkas.yigo.controllers.bootstraps.BootstrapViews;
	
	/*************************************************************\
	 * account上下文中心
	 *
	 * @author liekkas.zeng
	 * @since  2012-11-10 18:17:07
	 * @slogan 无边代码萧萧写，不带注释滚滚来
	 \*************************************************************/
	public class AccountContext extends Context
	{
		public function AccountContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			new BootstrapModels(injector);
			new BootstrapServices(injector);
			new BootstrapControllers(commandMap);
			new BootstrapViews(mediatorMap);
			
			super.startup();
		}
	}
}