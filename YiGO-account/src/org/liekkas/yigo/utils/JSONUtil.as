package org.liekkas.yigo.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class JSONUtil
	{
		public static function parseCategory():Array
		{
			var f:File = File.applicationDirectory.resolvePath("assets/configs/category.json");
			var fs:FileStream = new FileStream();
			fs.open(f, FileMode.READ);
			var feedJson:String = fs.readUTFBytes(fs.bytesAvailable);
			fs.close();
			var feeds:Object = JSON.parse(feedJson);
			var result:Array = [];
			for(var key:String in feeds)
			{
				var o:Object = new Object();
				o['type'] = key;
				o['values'] = String(feeds[key]).split(",");
				result.push(o);
			}
			return result;
		}
	}
}