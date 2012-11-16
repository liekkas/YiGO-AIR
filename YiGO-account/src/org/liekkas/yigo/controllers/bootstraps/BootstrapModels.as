package org.liekkas.yigo.controllers.bootstraps
{
	
	import org.liekkas.yigo.models.GlobalModel;
	import org.robotlegs.core.IInjector;

	/*************************************************************\
	 * 模型类映射关系
	 *
	 * @author liekkas.zeng
	 * @since  2012.03.09
	\*************************************************************/
	public class BootstrapModels
	{
		public function BootstrapModels(inject:IInjector)
		{
			inject.mapSingleton(GlobalModel);
		}
	}
}