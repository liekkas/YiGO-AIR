package org.liekkas.yigo.views.mediators
{
	import flash.events.MouseEvent;
	
	import org.liekkas.yigo.services.AccountService;
	import org.liekkas.yigo.views.SearchView;
	import org.robotlegs.mvcs.Mediator;
	
	public class SearchViewMediator extends Mediator
	{
		[Inject]public var view:SearchView;
		[Inject]public var service:AccountService;
		
		override public function onRegister():void{
		}
	}
}