package org.liekkas.yigo.controllers.bootstraps
{
	import org.liekkas.yigo.views.DailyCharge;
	import org.liekkas.yigo.views.Login;
	import org.liekkas.yigo.views.SearchView;
	import org.liekkas.yigo.views.comps.AccountOverview;
	import org.liekkas.yigo.views.comps.CategoryConfig;
	import org.liekkas.yigo.views.comps.DatabaseConfig;
	import org.liekkas.yigo.views.mediators.AccountOverviewMediator;
	import org.liekkas.yigo.views.mediators.CategoryConfigMediator;
	import org.liekkas.yigo.views.mediators.DailyChargeMediator;
	import org.liekkas.yigo.views.mediators.DatabaseConfigMediator;
	import org.liekkas.yigo.views.mediators.LoginMediator;
	import org.liekkas.yigo.views.mediators.SearchViewMediator;
	import org.robotlegs.core.IMediatorMap;

	/*************************************************************\
	 * 视图类映射关系
	 *
	 * @author liekkas.zeng
	 * @since  2012.03.09
	 \*************************************************************/
	public class BootstrapViews
	{
		public function BootstrapViews(mediatorMap:IMediatorMap)
		{
			mediatorMap.mapView(Login,LoginMediator);
			mediatorMap.mapView(DailyCharge,DailyChargeMediator);
			mediatorMap.mapView(CategoryConfig,CategoryConfigMediator);
			
			mediatorMap.mapView(AccountOverview,AccountOverviewMediator);
			
			mediatorMap.mapView(DatabaseConfig,DatabaseConfigMediator);
		}
	}
}