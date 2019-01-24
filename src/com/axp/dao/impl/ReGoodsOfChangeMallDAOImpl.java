package com.axp.dao.impl;import java.util.List;import org.hibernate.Query;import org.hibernate.Session;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Repository;import com.axp.dao.AdminUserDAO;import com.axp.dao.DateBaseDAO;import com.axp.dao.ReGoodsOfChangeMallDAO;import com.axp.model.AdminUser;import com.axp.model.ProvinceEnum;import com.axp.model.ReGoodsOfChangeMall;import com.axp.model.ReGoodsOfSellerMall;import com.axp.model.Seller;import com.axp.query.PageResult;import com.axp.util.QueryModel;@Repository@SuppressWarnings("unchecked")public class ReGoodsOfChangeMallDAOImpl extends BaseDaoImpl<ReGoodsOfChangeMall> implements ReGoodsOfChangeMallDAO {	@Autowired 	private  DateBaseDAO  dateBaseDAO;	@Autowired 	private AdminUserDAO adminUserDAO;    @Override    public PageResult<ReGoodsOfChangeMall> getGoodsList(Seller seller, Integer currentPage, Integer pageSize, String searchWord, Integer goodsType) {        Session session = sessionFactory.getCurrentSession();        //先获取查询条件；        String queryCount = "select count(r) from ReGoodsOfChangeMall r where r.snapshotGoods.seller=:seller and isValid=1 and r.snapshotGoods.name like "                + searchWord;        String queryList = "from ReGoodsOfChangeMall r where r.snapshotGoods.seller=:seller and isValid=1 and r.snapshotGoods.name like "                + searchWord + " order by r.stickyNum desc, r.id desc";        //先查询总条数；        Query query1 = session.createQuery(queryCount);        Long count = (Long) query1.setParameter("seller", seller).uniqueResult();        //计算当前页的数据；        Query query2 = session.createQuery(queryList).setParameter("seller", seller).setFirstResult((currentPage - 1) * pageSize)                .setMaxResults(pageSize);        List<ReGoodsOfChangeMall> list = query2.list();        //返回结果；        return new PageResult<>(Integer.parseInt(count.toString()), pageSize, currentPage, list);    }    @Override    public int findMasStickyNum(Integer sellerId) {        Session session = sessionFactory.getCurrentSession();        String queryCount = "select max(stickyNum) from ReGoodsOfChangeMall where snapshotGoods.seller.id = " + sellerId;        Query query = session.createQuery(queryCount);        return (int) query.uniqueResult();    }    @Override    public PageResult<ReGoodsOfChangeMall> getCheckPageresult(Integer currentPage, Integer pageSize,Integer adminUserId) {    	    	AdminUser adminUser = adminUserDAO.findById(adminUserId);    	ProvinceEnum provinceEnum = adminUser.getProvinceEnum();    	StringBuilder sb = new StringBuilder();        List<ReGoodsOfChangeMall> list= null;        QueryModel queryModel = new QueryModel();        queryModel.combPreEquals("isValid", true);        queryModel.combPreEquals("isChecked", false);		if(adminUser.getLevel()>=65&&adminUser.getLevel()<95){			if(provinceEnum.getLevel()==1){				sb.append("( snapshotGoods.seller.provinceEnum.id="+provinceEnum.getId()).				append(" or snapshotGoods.seller.provinceEnum.provinceEnum.id="+provinceEnum.getId()).				append(" or snapshotGoods.seller.provinceEnum.provinceEnum.provinceEnum.id="+provinceEnum.getId()).				append(")");			}else if (provinceEnum.getLevel()==2) {				sb.append("( snapshotGoods.seller.provinceEnum.id="+provinceEnum.getId()).				append(" or snapshotGoods.seller.provinceEnum.provinceEnum.id="+provinceEnum.getId()).				append(")");			}else if(provinceEnum.getLevel()==3){				sb.append("( snapshotGoods.seller.provinceEnum.id="+provinceEnum.getId());			}			queryModel.combCondition(sb.toString());		}		Integer count = dateBaseDAO.findCount(ReGoodsOfChangeMall.class, queryModel);		list=	dateBaseDAO.findPageList(ReGoodsOfChangeMall.class, queryModel, (currentPage-1)*pageSize, pageSize);        //返回结果；        return new PageResult<>(Integer.parseInt(count.toString()), pageSize, currentPage, list);    }    @Override    public List<ReGoodsOfChangeMall> getGoodsByBaseGoodsId(Integer id) {        Session session = sessionFactory.getCurrentSession();        String hql = "from ReGoodsOfChangeMall where isValid=1 and baseGoodsId=" + id;        Query query = session.createQuery(hql);        return query.list();    }}