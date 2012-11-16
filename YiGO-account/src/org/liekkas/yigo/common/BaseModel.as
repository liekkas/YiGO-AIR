package org.liekkas.yigo.common
{
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	/*************************************************************\
	 * 数据模型基类，使得每个数据模型都能随心存取数据
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:17:29
	 \*************************************************************/
	public class BaseModel extends Actor
	{
		private var dict:Dictionary = new Dictionary();
		
		/**
		 * 读取数据
		 * */
		public function getAttribute(name:String):*
		{
			if (dict.hasOwnProperty(name))
			{
				return dict[name];
			}
			else
			{
				trace("字典中没找到" + name + "属性值!");
				return null;
			}
		}		
		
		/**
		 * 存放数据
		 * */
		public function setAttribute(name:String, value:*):void
		{
			dict[name] = value;	
			trace("存入属性 >>> "+ name);
		}	
	}
}