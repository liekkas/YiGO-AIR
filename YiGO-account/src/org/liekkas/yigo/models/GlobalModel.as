package org.liekkas.yigo.models
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import org.liekkas.yigo.common.BaseModel;
	
	/*************************************************************\
	 * 全局数据模型
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 12:11:59
	 \*************************************************************/
	public class GlobalModel extends BaseModel
	{
		public var DATABASE_FILE:String = "DATABASE_FILE";
		public var SQL_TABLES:String = "SQL_TABLES";
		public var SQL_CONNECTION:String = "SQL_CONNECTION";
		
		public function init():void
		{
			var dbFile:File  = File.applicationStorageDirectory.resolvePath("YiGO-account.db");
			var sqlTables:File = File.applicationDirectory.resolvePath("assets"+File.separator+"configs"+File.separator + "sql_tables.xml");
			this.setAttribute(DATABASE_FILE,dbFile);
			this.setAttribute(SQL_TABLES,sqlTables);
		}
	}
}