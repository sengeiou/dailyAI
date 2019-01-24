package com.axp.service.goods;import java.util.List;import java.util.Map;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import com.axp.model.ReBaseGoods;import com.axp.model.ReGoodsOfSellerMall;import com.axp.query.PageResult;public interface ReGoodsOfSellerMallService {    /**     * 商城商品保存操作；     *     * @param mallParamter 封装了所有上传参数的对象；     */    void doSave(ReBaseGoods.MallParamter mallParamter) throws Exception;    Map<String, Object> zhiding(HttpServletRequest request, HttpServletResponse response);    /**     * 获取所有的待审核的商家商城的商品；     *     * @param currentPage 当前页；     * @param pageSize    每页条数；     * @return     */    PageResult<ReGoodsOfSellerMall> getCheckPageresult(Integer currentPage, Integer pageSize,Integer adminUserId);    /**     * 审核操作     *     * @param checkGoodsId 要审核的商品id值；     * @param returnMap     * @return     */    Map<String, Object> checkGoods(Integer checkGoodsId, Map<String, Object> returnMap);    /**     * 根据id值获取对象；     *     * @param checkGoodsId     * @return     */    ReGoodsOfSellerMall get(Integer checkGoodsId);    /**     * 审核操作；     *     * @param returnMamp 返回值；     * @param isPass     是否通过；     * @param checkDesc  审核内容；     * @param goodsId    审核商品id值；     * @return     */    Map<String, Object> doCheck(Map<String, Object> returnMamp, Boolean isPass, String checkDesc, Integer goodsId) throws Exception;        List<Map<String, Object>> getGoodsPublishStatus(Integer sellerMallId);	/**	 * 查询所有有效的商品	 * @return	 */	List<ReGoodsOfSellerMall> findByAll();	/**	 * 根据商店查出商品	 * @param sellerId	 * @return	 */	List<ReGoodsOfSellerMall> findBySeller(Integer sellerId);}