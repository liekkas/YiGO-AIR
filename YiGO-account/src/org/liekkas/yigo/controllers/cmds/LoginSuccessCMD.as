package org.liekkas.yigo.controllers.cmds
{
	import mx.core.IVisualElementContainer;
	
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.services.AccountService;
	import org.liekkas.yigo.utils.SQLUtil;
	import org.liekkas.yigo.views.Main;
	import org.robotlegs.mvcs.Command;
	
	/*************************************************************\
	 * 登录成功执行任务
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:07:14
	 \*************************************************************/
	public class LoginSuccessCMD extends Command
	{
		[Inject]public var glModel:GlobalModel;
		[Inject]public var service:AccountService;
		
		override public function execute():void
		{
			SQLUtil.executeBatch(glModel.getAttribute(glModel.SQL_TABLES),
				glModel.getAttribute(glModel.SQL_CONNECTION));
			service.conn = glModel.getAttribute(glModel.SQL_CONNECTION);
			service.getAllAccounts();
			IVisualElementContainer(contextView).addElement(new Main());
		}
	}
}