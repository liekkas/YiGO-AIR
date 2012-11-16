package org.liekkas.yigo.views.mediators
{
	import com.amcharts.events.GraphEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.LinkButton;
	
	import org.liekkas.yigo.services.AccountService;
	import org.liekkas.yigo.utils.XMLUtil;
	import org.liekkas.yigo.views.comps.AccountOverview;
	import org.robotlegs.mvcs.Mediator;
	
	import spark.components.Label;
	
	public class AccountOverviewMediator extends Mediator
	{
		[Inject]public var view:AccountOverview;
		[Inject]public var service:AccountService;
		
		override public function onRegister():void
		{
			view.setCategorys(XMLUtil.parseCategory());
			view.chartData = service.getAccountsOnYear();	
			
			eventMap.mapListener(view.chart,GraphEvent.CLICK_GRAPH_ITEM,onDrill,GraphEvent);
			eventMap.mapListener(view.all,MouseEvent.CLICK,onAll,MouseEvent);
		}
		
		private function onDrill(evt:GraphEvent):void
		{
			var type:String = evt.item.category;
			var ele:int = view.hb.numElements;
			if(ele==1) //只有全部
			{
				var lb:LinkButton = new LinkButton();
				lb.label = type;
				lb.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
				{
					if(view.hb.numElements==3) view.hb.removeElementAt(2);
					view.chartData = service.getAccountsOnMonth(type);
				});
				view.hb.addElement(lb);
				view.chartData = service.getAccountsOnMonth(type);	
			}else if(ele==2)
			{
				var yearlb:LinkButton = LinkButton(view.hb.getElementAt(1));
				var l:LinkButton = new LinkButton();
				l.label = type;
				view.hb.addElement(l);
				view.chartData = service.getAccountsOnDay(yearlb.label,type);
			}
		}
		
		private function onAll(evt:MouseEvent):void
		{
			var all:LinkButton = LinkButton(view.hb.getElementAt(0));
			view.hb.removeAllElements();
			view.hb.addElement(all);
			view.chartData = service.getAccountsOnYear();
		}
	}
}