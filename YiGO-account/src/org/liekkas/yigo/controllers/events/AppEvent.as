package org.liekkas.yigo.controllers.events
{
	import flash.events.Event;
	
	/*************************************************************\
	 * 事件类
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:02:18
	 \*************************************************************/
	public class AppEvent extends Event
	{
		/**
		 * 登录成功派发
		 * */
		public static const LOGIN_SUCCESS:String = "LOGIN_SUCCESS";
		
		/**
		 * 账单类型发生变化
		 * */
		public static const CATEGORYS_CHANGED:String = "CATEGORYS_CHANGED";
		
		/**
		 * 账单加载成功派发
		 * */
		public static const ACCOUNT_DATA_LOADED:String = "ACCOUNT_DATA_LOADED";
		
		public var data:*;
		
		public function AppEvent(type:String,data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new AppEvent(type,data,bubbles,cancelable);
		}
	}
}