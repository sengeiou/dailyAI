package com.axp.dao;import com.axp.model.AdminUser;import com.axp.model.ReSellerWithdrawRecord;import com.axp.query.PageResult;import java.util.List;public interface ReSellerWithdrawRecordDAO extends IBaseDao<ReSellerWithdrawRecord> {    /**     * 获取商家兑换记录列表数据；     *     * @param currentPage 当前页；     * @param pageSize    每页条数；     * @param adminUsers  要查询哪些人的提现记录；     * @return     */    PageResult<ReSellerWithdrawRecord> getRecordList(Integer currentPage, Integer pageSize, List<AdminUser> adminUsers);    /**     * 获取所有通过审核的商家提现记录；     *     * @return     */    PageResult<ReSellerWithdrawRecord> getCheckedRecord(Integer currentPage, Integer pageSize);}