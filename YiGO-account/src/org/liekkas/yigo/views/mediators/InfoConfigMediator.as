package org.liekkas.yigo.views.mediators
{
	import flash.events.MouseEvent;
	
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.services.AccountService;
	import org.liekkas.yigo.utils.JSONUtil;
	import org.liekkas.yigo.utils.XMLUtil;
	import org.liekkas.yigo.views.InfoConfig;
	import org.robotlegs.mvcs.Mediator;
	
	/*************************************************************\
	 * infocomp mediator
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 15:13:24
	 \*************************************************************/
	public class InfoConfigMediator extends Mediator
	{
		[Inject]public var view:InfoConfig;
		[Inject]public var service:AccountService;
		[Inject]public var glModel:GlobalModel;
		
		override public function onRegister():void
		{
			
		}
	}
}