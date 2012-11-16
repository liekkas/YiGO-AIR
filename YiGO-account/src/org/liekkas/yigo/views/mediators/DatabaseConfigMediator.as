package org.liekkas.yigo.views.mediators
{
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.views.comps.DatabaseConfig;
	import org.robotlegs.mvcs.Mediator;
	
	public class DatabaseConfigMediator extends Mediator
	{
		[Inject]public var view:DatabaseConfig;
		[Inject]public var glModel:GlobalModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view.initDB,MouseEvent.CLICK,onInitDB,MouseEvent);
			eventMap.mapListener(view.exportDB,MouseEvent.CLICK,onExportDB,MouseEvent);
			eventMap.mapListener(view.importDB,MouseEvent.CLICK,onImportDB,MouseEvent);
		}
		
		private function onInitDB(evt:MouseEvent):void
		{
			Alert.show("重置数据库会把以前的数据全部删掉，请做好备份！确定重置？","提示:",Alert.OK|Alert.NO,view,
				function(evt:CloseEvent):void
				{
					if(evt.detail == Alert.OK)
					{
						var databaseFile:File = glModel.getAttribute(glModel.DATABASE_FILE);
						if(databaseFile) databaseFile.deleteFileAsync();
					}
				});
		}
		
		private function onExportDB(evt:MouseEvent):void
		{
			
		}
		
		private function onImportDB(evt:MouseEvent):void
		{
			
		}
	}
}