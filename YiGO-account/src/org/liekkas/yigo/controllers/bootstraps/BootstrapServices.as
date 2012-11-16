package org.liekkas.yigo.controllers.bootstraps
{
	import org.liekkas.yigo.services.AccountService;
	import org.robotlegs.core.IInjector;

	/*************************************************************\
	 * 服务类映射关系
	 *
	 * @author liekkas.zeng
	 * @since  2012.03.09
	\*************************************************************/
	public class BootstrapServices
	{
		public function BootstrapServices(inject:IInjector)
		{
			inject.mapSingleton(AccountService);
		}
	}
}