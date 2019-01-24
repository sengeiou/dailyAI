package com.axp.dao.impl;import java.util.List;import org.hibernate.Query;import org.hibernate.Session;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Repository;import com.axp.dao.AdminUserDAO;import com.axp.dao.DateBaseDAO;import com.axp.dao.ReGoodsOfScoreMallDAO;import com.axp.model.AdminUser;import com.axp.model.ProvinceEnum;import com.axp.model.ReGoodsOfScoreMall;import com.axp.model.ReGoodsOfSellerMall;import com.axp.model.Seller;import com.axp.query.PageResult;import com.axp.util.QueryModel;@Repository@SuppressWarnings("unchecked")public class ReGoodsOfScoreMallDAOImpl extends BaseDaoImpl<ReGoodsOfScoreMall> implements ReGoodsOfScoreMallDAO {	@Autowired 	private  DateBaseDAO  dateBaseDAO;	@Autowired 	private AdminUserDAO adminUserDAO;    @Override    public PageResult<ReGoodsOfScoreMall> getGoodsList(Seller seller, Integer currentPage, Integer pageSize, String searchWord) {        Session session = sessionFactory.getCurrentSession();        //先获取查询条件；r.snapshotGoods.seller=:seller and         String queryCount = "select count(r) from ReGoodsOfScoreMall r where r.isValid=1 and r.snapshotGoods.name like "                + searchWord;        String queryList = "from ReGoodsOfScoreMall r where  isValid=1 and r.snapshotGoods.name like "                + searchWord + "  order by r.zhidingTime  desc r.id desc";        //先查询总条数；        Query query1 = session.createQuery(queryCount);        Long count = (Long) query1.uniqueResult();        //计算当前页的数据；        Query query2 = session.createQuery(queryList).setFirstResult((currentPage - 1) * pageSize)                .setMaxResults(pageSize);        List<ReGoodsOfScoreMall> list = query2.list();        //返回结果；        return new PageResult<>(Integer.parseInt(count.toString()), pageSize, currentPage, list);    }    @Override    public PageResult<ReGoodsOfScoreMall> getCheckPageresult(Integer currentPage, Integer pageSize,Integer adminUserId) {    	AdminUser adminUser = adminUserDAO.findById(adminUserId);    	ProvinceEnum provinceEnum = adminUser.getProvinceEnum();    	StringBuilder sb = new StringBuilder();        List<ReGoodsOfScoreMall> list= null;        QueryModel queryModel = new QueryModel();        queryModel.combPreEquals("isValid", true);        queryModel.combPreEquals("isChecked", false);		if(adminUser.getLevel()>=65&&adminUser.getLevel()<95){			if(provinceEnum.getLevel()==1){				sb.append("( snapshotGoods.seller.provinceEnum.id="+provinceEnum.getId()).				append(" or snapshotGoods.seller.provinceEnum.provinceEnum.id="+provinceEnum.getId()).				append(" or snapshotGoods.seller.provinceEnum.provinceEnum.provinceEnum.id="+provinceEnum.getId()).				append(")");			}else if(provinceEnum.getLevel()==2){ //地级市				queryModel.combCondition("  snapshotGoods.seller.provinceEnum.provinceEnum2.id= "+provinceEnum.getId()+"  or "						+ "  snapshotGoods.seller.provinceEnum.id= "+provinceEnum.getId());			}else if(provinceEnum.getLevel2()==3&&provinceEnum.getLevel()==2||provinceEnum.getLevel()==3){ //县级市				sb.append("( snapshotGoods.seller.provinceEnum.id="+provinceEnum.getId()).				append(")");			}			queryModel.combCondition(sb.toString());		}		Integer count = dateBaseDAO.findCount(ReGoodsOfScoreMall.class, queryModel);		list=	dateBaseDAO.findPageList(ReGoodsOfScoreMall.class, queryModel, (currentPage-1)*pageSize, pageSize);		        //返回结果；        return new PageResult<>(Integer.parseInt(count.toString()), pageSize, currentPage, list);    }    @Override    public List<ReGoodsOfScoreMall> getGoodsByBaseGoodsId(Integer id) {        Session session = sessionFactory.getCurrentSession();        String hql = "from ReGoodsOfScoreMall r where isValid=1 and baseGoodsId=" + id;        return session.createQuery(hql).list();    }	@Override	public PageResult<ReGoodsOfScoreMall> getGoodsList(Integer valueOf, Integer currentPage,			Integer pageSize, String search) {		 Session session = sessionFactory.getCurrentSession();		 String queryCount = "select count(r) from ReGoodsOfScoreMall r where r.addedTime < now()"				 				+"and r.shelvesTime > now() and isValid=1 and isChecked=1";		 String queryList = "from ReGoodsOfScoreMall r where r.addedTime < now()"	 				+"and r.shelvesTime > now() and isValid=1 and isChecked=1";		 		 if(!"".equals(search)){			 queryCount += " and r.snapshotGoods.name like "  + search ;			 queryList += " and r.snapshotGoods.name like "  + search ;					 		 }		 if(valueOf ==4){ //超级特惠			queryCount += " and score < 100 and (transportationType =1 or transportationType =2)";			queryList += " and score < 100 and (transportationType =1 or transportationType =2) order by  r.zhidingTime  desc";		 }		 if(valueOf == 6){ //人气推荐, 销量排序			 queryCount += " and score>=100 and score<=500 and transportationType =1 or transportationType =2";			 queryList += " and score>=100  and score<=500 and transportationType =1 or transportationType =2 order by  zhidingTime desc";		}		if(valueOf == 3){						queryList += "  order by zhidingTime desc addedTime desc";		}        //先查询总条数；        Query query1 = session.createQuery(queryCount);        Long count = (Long) query1.uniqueResult();        //计算当前页的数据；        Query query2 = session.createQuery(queryList).setFirstResult((currentPage - 1) * pageSize).setMaxResults(pageSize);        List<ReGoodsOfScoreMall> list = query2.list();        //返回结果；        return new PageResult<>(Integer.parseInt(count.toString()), pageSize, currentPage, list);	}}