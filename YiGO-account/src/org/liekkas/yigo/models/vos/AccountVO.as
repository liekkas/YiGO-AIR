package org.liekkas.yigo.models.vos
{
	/*************************************************************\
	 * 一条账目信息
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-7 16:16:32
	 \*************************************************************/
	public class AccountVO
	{
		public var id:int; //账目唯一标识
		
		public var category:String; //分类
		
		public var detail:String; //详情
		
		public var cost:Number; //消费金额
		
		public var total:Number; //总金额
		
		public var remark:String; //备注
		
		public var date:String; //创建日期
		
		public var year:String;
		
		public var month:String;
		
	}
}