package org.liekkas.yigo.views.mediators
{
	import flash.events.MouseEvent;
	
	import org.liekkas.utils.ZDate;
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.services.AccountService;
	import org.liekkas.yigo.utils.JSONUtil;
	import org.liekkas.yigo.utils.XMLUtil;
	import org.liekkas.yigo.views.DailyCharge;
	import org.robotlegs.mvcs.Mediator;
	
	/*************************************************************\
	 * mediator
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-10 10:39:25
	 \*************************************************************/
	public class DailyChargeMediator extends Mediator
	{
		[Inject]public var view:DailyCharge;
		[Inject]public var glModel:GlobalModel;
		[Inject]public var service:AccountService;
		
		override public function onRegister():void
		{
			view.title = ZDate.getDayWithWeek(new Date());
			view.setCategory(XMLUtil.parseCategory());
			view.saveBtn.addEventListener(MouseEvent.CLICK,onSave);
			
			eventMap.mapListener(eventDispatcher,AppEvent.CATEGORYS_CHANGED,onCategoryChanged,AppEvent);
		}
		
		protected function onSave(event:MouseEvent):void
		{
			service.addAccounts(view.getAccounts());
		}
		
		private function onCategoryChanged(evt:AppEvent):void
		{
			view.setCategory(evt.data);
		}
	}
}