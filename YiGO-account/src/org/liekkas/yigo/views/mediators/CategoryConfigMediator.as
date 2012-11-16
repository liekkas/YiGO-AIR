package org.liekkas.yigo.views.mediators
{
	import flash.events.MouseEvent;
	
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.liekkas.yigo.utils.XMLUtil;
	import org.liekkas.yigo.views.comps.CategoryConfig;
	import org.robotlegs.mvcs.Mediator;
	
	/*************************************************************\
	 * 类型配置mediator
	 *
	 * @author liekkas.zeng
	 * @since  2012-11-13 16:12:49
	 * @slogan 无边代码萧萧写，不带注释滚滚来
	 \*************************************************************/
	public class CategoryConfigMediator extends Mediator
	{
		[Inject]public var view:CategoryConfig;
		
		override public function onRegister():void
		{
			view.initData(XMLUtil.parseCategory());
			eventMap.mapListener(view.saveBtn,MouseEvent.CLICK,onSave,MouseEvent);
		}
		
		private function onSave(evt:MouseEvent):void
		{
			XMLUtil.saveCategory(view.getAllConfig());
			
			//通知记账首页重新生成页面
			dispatch(new AppEvent(AppEvent.CATEGORYS_CHANGED,XMLUtil.parseCategory()));
		}
	}
}