package com.axp.service.goods;import java.util.Map;import javax.servlet.http.HttpServletRequest;import com.axp.model.ReBaseGoods;import com.axp.model.ReGoodsOfSeckillMall;import com.axp.query.PageResult;public interface ReGoodsOfSeckillMallService {    /**     * 商城商品保存操作；     *     * @param mallParamter 封装了所有上传参数的对象；     */    void doSave(ReBaseGoods.MallParamter mallParamter) throws Exception;    /**     * 获取所有的待审核的秒杀商城的商品；     *     * @param currentPage 当前页；     * @param pageSize    每页条数；     * @return     */    PageResult<ReGoodsOfSeckillMall> getCheckPageresult(Integer currentPage, Integer pageSize,Integer adminUserId);    /**     * 根据id获取对象；     *     * @param checkGoodsId     * @return     */    ReGoodsOfSeckillMall get(Integer checkGoodsId);    /**     * 商品审核；     *     * @param returnMamp     * @param isPass     * @param checkDesc     * @param goodsId     * @return     */    Map<String, Object> doCheck(Map<String, Object> returnMamp, Boolean isPass, String checkDesc, Integer goodsId) throws Exception;    void doSavePut(HttpServletRequest request) throws Exception;}