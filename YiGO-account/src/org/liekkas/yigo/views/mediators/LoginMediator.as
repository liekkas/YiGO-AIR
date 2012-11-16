package org.liekkas.yigo.views.mediators
{
	import flash.events.Event;
	
	import mx.core.IVisualElementContainer;
	
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.views.Login;
	import org.robotlegs.mvcs.Mediator;
	
	/*************************************************************\
	 * 登录mediator
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:01:08
	 \*************************************************************/
	public class LoginMediator extends Mediator
	{
		[Inject]public var view:Login;
		[Inject]public var model:GlobalModel;
		
		override public function onRegister():void
		{
			view.databaseFile = model.getAttribute(model.DATABASE_FILE);
			addViewListener("success",onLoginSuccess,Event);
		}
		
		private function onLoginSuccess(evt:Event):void
		{
			model.setAttribute(model.SQL_CONNECTION,view.sqlConnection);
			mediatorMap.removeMediator(this);
			IVisualElementContainer(contextView).removeElement(view);
			dispatch(new AppEvent(AppEvent.LOGIN_SUCCESS));
		}
	}
}