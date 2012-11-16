package org.liekkas.yigo.services
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	
	import mx.controls.Alert;
	import mx.utils.StringUtil;
	
	import org.liekkas.yigo.controllers.events.AppEvent;
	import org.liekkas.yigo.models.GlobalModel;
	import org.liekkas.yigo.models.vos.AccountVO;
	import org.liekkas.yigo.utils.SQLUtil;
	import org.robotlegs.mvcs.Actor;
	
	/*************************************************************\
	 * 服务类
	 *
	 * @author liekkas.zeng
	 * @since  2012-9-8 15:29:15
	 \*************************************************************/
	public class AccountService extends Actor
	{
		[Inject]public var glModel:GlobalModel;
		
		public var conn:SQLConnection;
		
		/**
		 * 获取所有的账单信息
		 * */
		public function getAllAccounts():Array
		{
			var sql:String = "select * from T_ACCOUNT order by id desc";
			var state:SQLStatement=new SQLStatement();
			state.text = sql;
			var result:Array = SQLUtil.query(state,conn);
			return result;
		}
		
		/**
		 * 年粒度上获取账单信息，例如：2012 - 吃,喝 - 23,45 用了group_concat方法，把账单类型合在一起
		 * */
		public function getAccountsOnYear():Array
		{
			var sql:String = "select p.year date,group_concat(p.category) categorys,group_concat(p.cost) costs from"
							 + " (select t.year,t.category,sum(t.cost) cost from T_ACCOUNT t group by t.year,t.category)p"
							 + " group by p.year";
			var state:SQLStatement=new SQLStatement();
			state.text = sql;
			var result:Array = SQLUtil.query(state,conn);
			var treat:Array = [];
			for each(var o:Object in result)
			{
				var after:Object = new Object();
				after['date'] = o['date'];
				if(o.hasOwnProperty("categorys")&&(StringUtil.trim(o['categorys'])!=""))
				{
					var categorys:Array = String(o['categorys']).split(",");
					var costs:Array = String(o['costs']).split(",");
					for(var i:int=0;i<categorys.length;i++)
					{
						after[categorys[i]] = costs[i];
					}
				}
				treat.push(after);
			}
			return treat;
		}
		
		/**
		 * 根据年获取月粒度上获取账单信息，例如：2012 - 吃,喝 - 23,45 用了group_concat方法，把账单类型合在一起
		 * */
		public function getAccountsOnMonth(year:String):Array
		{
			var sql:String = "select p.month date,group_concat(p.category) categorys,group_concat(p.cost) costs from"
							+" (select t.month,t.category,sum(t.cost) cost from T_ACCOUNT t where t.year="+year+" group by t.month,t.category)p"
							+" group by p.month";
			var state:SQLStatement=new SQLStatement();
			state.text = sql;
			var result:Array = SQLUtil.query(state,conn);
			var treat:Array = [];
			for each(var o:Object in result)
			{
				var after:Object = new Object();
				after['date'] = o['date'];
				if(o.hasOwnProperty("categorys")&&(StringUtil.trim(o['categorys'])!=""))
				{
					var categorys:Array = String(o['categorys']).split(",");
					var costs:Array = String(o['costs']).split(",");
					for(var i:int=0;i<categorys.length;i++)
					{
						after[categorys[i]] = costs[i];
					}
				}
				treat.push(after);
			}
			return treat;
		}
		
		/**
		 * 根据年,月获取天粒度上获取账单信息，例如：2012 - 吃,喝 - 23,45 用了group_concat方法，把账单类型合在一起
		 * */
		public function getAccountsOnDay(year:String,month:String):Array
		{
			var sql:String = "select p.date,group_concat(p.category) categorys,group_concat(p.cost) costs from"
							+" (select t.date,t.category,sum(t.cost) cost from t_account t where t.year="+year+" and t.month="+month+" group by t.date,t.category)p"
							+" group by p.date";
			var state:SQLStatement=new SQLStatement();
			state.text = sql;
			var result:Array = SQLUtil.query(state,conn);
			var treat:Array = [];
			for each(var o:Object in result)
			{
				var after:Object = new Object();
				after['date'] = String(o['date']).substr(8,2);
				if(o.hasOwnProperty("categorys")&&(StringUtil.trim(o['categorys'])!=""))
				{
					var categorys:Array = String(o['categorys']).split(",");
					var costs:Array = String(o['costs']).split(",");
					for(var i:int=0;i<categorys.length;i++)
					{
						after[categorys[i]] = costs[i];
					}
				}
				treat.push(after);
			}
			return treat;
		}
		
		
		public function addAccounts(accounts:Array):void
		{
			var flag:Boolean;
			for each(var accout:AccountVO in accounts)
			{
				var sql:String = "INSERT into T_ACCOUNT(id,category,cost,total,remark,detail,date,year,month) values('" +
					accout.id+"','" +accout.category+"','" +accout.cost+"','"+accout.total+"','"+accout.remark+"','"+accout.detail+"','"+accout.date+"','"+
					accout.year+"','"+accout.month+"')";
				var state:SQLStatement=new SQLStatement();
				state.text = sql;
				flag = SQLUtil.execute(state,conn);
			}
			if(flag)Alert.show("保存成功！");
		}
		
	}
}