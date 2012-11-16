package org.liekkas.yigo.controllers.cmds
{
	import mx.core.IVisualElementContainer;
	
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.views.Login;
	import org.robotlegs.mvcs.Command;
	
	/*************************************************************\
	 * 项目启动后执行任务
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:09:18
	 \*************************************************************/
	public class StartupCompleteCMD extends Command
	{
		[Inject]public var glModel:GlobalModel;
		
		override public function execute():void
		{
			glModel.init();
			IVisualElementContainer(contextView).addElement(new Login());
			trace("StartupCompleteCMD");
		}
	}
}