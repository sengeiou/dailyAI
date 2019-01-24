package com.axp.service.money;import com.axp.model.SellerMoneyRecord;import com.axp.query.PageResult;public interface SellerMoneyRecordService {    /**     * 获取商家金额变动情况；     *     * @param sellerId    商家id值；     * @param currentPage 当前页；     * @param pageSize    每页显示条数；     * @return     */    PageResult<SellerMoneyRecord> getSellerMoneyChangeRecord(Integer sellerId, Integer currentPage, Integer pageSize);}