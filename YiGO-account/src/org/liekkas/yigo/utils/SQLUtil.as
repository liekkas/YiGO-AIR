package org.liekkas.yigo.utils
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLTransactionLockType;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	/*************************************************************\
	 * sql工具类
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 15:16:38
	 \*************************************************************/
	public class SQLUtil
	{
		/**
		 * 批量执行sql语句
		 * */
		public static function executeBatch(file:File, connection:SQLConnection):void
		{
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var xml:XML = XML(stream.readUTFBytes(stream.bytesAvailable));
			stream.close();
			connection.begin(SQLTransactionLockType.IMMEDIATE);
			for each (var statement:XML in xml.statement)
			{
	            var stmt:SQLStatement = new SQLStatement();
	            stmt.sqlConnection = connection;
				stmt.text = statement;
				stmt.execute();			
			}
			connection.commit();
		}
		
		/**
		 * 执行查询语句
		 * */
		public static function query(sqlStatement:SQLStatement,connection:SQLConnection):Array
		{
			try{ 
				sqlStatement.sqlConnection = connection;
				var result:Array;
				sqlStatement.addEventListener(SQLEvent.RESULT, function(evt:SQLEvent):void
				{
					result = evt.target.getResult().data as Array;	
				});
				sqlStatement.addEventListener(SQLErrorEvent.ERROR, errorHandler);
				sqlStatement.execute();
				return result;
			}catch(error:Error){
				trace('执行语句异常：'+error.getStackTrace());
			} 
			return null;
		}
		
		/**
		 * 执行 更新、添加、删除等操作，返回是否成功
		 * */
		public static function execute(state:SQLStatement,connection:SQLConnection):Boolean
		{
			try
			{
				state.sqlConnection=connection;
				state.addEventListener(SQLErrorEvent.ERROR, errorHandler);
				state.execute();
				return true;
			}
			catch(error:Error)
			{
				trace("执行发生异常:"+ error.getStackTrace());
			}
			return false;
		}
		
		/**
		 * 错误处理
		 * */
		private static function errorHandler(evt:SQLErrorEvent):void
		{
			trace("数据库操作失败："+ evt.error.getStackTrace());
		}
	}
}