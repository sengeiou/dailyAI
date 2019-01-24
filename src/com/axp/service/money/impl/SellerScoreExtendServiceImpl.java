package com.axp.service.money.impl;import java.sql.Timestamp;import java.util.List;import java.util.Map;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import com.axp.model.SellerMoneyRecord;import org.springframework.stereotype.Service;import com.axp.dao.ISellerMoneyRecordDao;import com.axp.model.AdminUser;import com.axp.model.AdminUserScoreRecord;import com.axp.model.ReSellerWithdrawRecord;import com.axp.model.Seller;import com.axp.model.SellerScoreExtend;import com.axp.query.PageResult;import com.axp.service.money.ReSellerWithdrawRecordService;import com.axp.service.money.SellerScoreExtendService;import com.axp.service.system.impl.BaseServiceImpl;import com.axp.util.CalcUtil;import com.axp.util.QueryModel;import com.axp.util.StringUtil;@Servicepublic class SellerScoreExtendServiceImpl extends BaseServiceImpl implements SellerScoreExtendService {		@Override	public PageResult<SellerScoreExtend> getRecordList(			Integer currentPage, Integer pageSize, Seller seller) {				return sellerScoreExtendDAO.getRecordList(currentPage, pageSize, seller);	}		@Override	public SellerScoreExtend findById(Integer id) {				return sellerScoreExtendDAO.findById(id);	}	@Override	public int deleteById(Integer id) {		SellerScoreExtend sse = sellerScoreExtendDAO.findById(id);		QueryModel model = new QueryModel();		model.combPreEquals("isValid", true);		model.combPreEquals("sellerId", sse.getSeller().getId());		List<AdminUser> adminUsers = dateBaseDao.findLists(AdminUser.class, model);		if(adminUsers == null || adminUsers.size()<0){			return 0;		}		AdminUser adminUser = adminUsers.get(0);		adminUser.setScore(adminUser.getScore()+sse.getScore());//删除了积分券, 对应的积分就要退回到商家上		adminUser.setLasttime(new Timestamp(System.currentTimeMillis()));		adminUser.setMoney(adminUser.getMoney()+sse.getMoney());		adminUserDAO.saveOrUpdate(adminUser);		sse.setIsvalid(false);		sellerScoreExtendDAO.saveOrUpdate(sse);		//记录交易情况								return 1;	}		@Override	public Map<String, Object> saveScoreExtend(Integer id,HttpServletRequest request,			HttpServletResponse response) {		Integer adminUserId = (Integer) request.getSession().getAttribute("currentUserId");		String name = request.getParameter("name"); 		String extendNum = request.getParameter("extendNum");		String remark = request.getParameter("remark");		String img = request.getParameter("img");		String money = request.getParameter("money");		SellerScoreExtend sse = new SellerScoreExtend();		if(id != null){			sse = sellerScoreExtendDAO.findById(id);		}		AdminUser adminUser = adminUserDAO.findById(adminUserId);		Seller seller = sellerDAO.findById(adminUser.getSellerId());		Timestamp time = new Timestamp(System.currentTimeMillis());		sse.setCreatetime(time);		sse.setExtendImage(img);		sse.setExtendNum(Integer.valueOf(extendNum));		sse.setIsvalid(true);		sse.setMoney(Double.valueOf(money));		sse.setName(name);		sse.setRemark(remark);		sse.setSeller(seller);		sse.setValidityTime(time);		sse.setScore((int) (Integer.valueOf(extendNum)*Double.valueOf(money)));		sellerScoreExtendDAO.saveOrUpdate(sse);				//推广优惠券 就要减少他的积分		adminUser.setScore(adminUser.getScore()-sse.getScore());		adminUser.setLasttime(time);		adminUserDAO.saveOrUpdate(adminUser);				//做记录		AdminUserScoreRecord asr = new AdminUserScoreRecord();		asr.setAdminUser(adminUser);		asr.setCreateTime(time);		asr.setIsValid(true);		asr.setScore(sse.getScore());		asr.setAfterScore(adminUser.getScore());		asr.setBeforeScore(adminUser.getScore()-sse.getScore());		asr.setRemark("商家"+seller.getName()+",使用积分做积分券推广");		adminUserScoreRecordDAO.saveOrUpdate(asr);		return null;	}							}