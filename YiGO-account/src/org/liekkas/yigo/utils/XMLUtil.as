package org.liekkas.yigo.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class XMLUtil
	{
		public static function parseCategory():Array
		{
			var f:File = File.applicationDirectory.resolvePath("assets/configs/category.xml");
			var fs:FileStream = new FileStream();
			fs.open(f, FileMode.READ);
			var feed:String = fs.readUTFBytes(fs.bytesAvailable);
			fs.close();
			var result:Array = [];
			var xml:XML = new XML(feed);
			for each(var x:XML in xml.category)
			{
				var o:Object = new Object();
				o['type'] = String(x.@name);
				var arr:Array = [];
				for each(var k:XML in x.kind)
				{
					arr.push(String(k.@name));
				}
				o['values'] = arr;
				result.push(o);
			}
			return result;
		}
		
		public static function saveCategory(xml:XML):void
		{
			var f:File = new File(File.applicationDirectory.resolvePath("assets/configs/category.xml").nativePath);
			var fs:FileStream = new FileStream();
			fs.open(f,FileMode.WRITE);
			fs.writeUTFBytes(xml.toString());
			fs.close();
		}
	}
}