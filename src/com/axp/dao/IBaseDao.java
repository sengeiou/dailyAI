package com.axp.dao;

import java.util.List;

public interface IBaseDao<T> {
	void save(T t);

	void update(T t);

	void merge(T t);

	void saveOrUpdate(T t);

	void delete(T t);

	List<T> findAll();

	T findById(Integer id);
	
	T findByIdValid(Integer id);

	List<T> findByProperty(String propertyName, Object value);

	public void updatePropertyByID(String propertyName, Object value, int id, Class<T> model);

	Integer findCountByQueryChar(String queryChar);

	List<T> findListByQueryChar(String queryChar, Integer startIndex, Integer pageSize);

	List<T> findListByQueryChar(String queryChar);

	public List<T> findByCon(Class<T> model, String condition, int start, int end);

	public List<T> findByCon(Class<T> model, String condition);

	public <E> int getCountsByCon(Class<E> model, String con, Object... values);

	public <E> List<E> getListByCon(Class<E> model, String con, Integer start, Integer end, String orderBy, Object... values);

	public <E> int getAllCountAndCon(Class<E> model, String condition);

	public <E> List<E> findByPageOrderAndCon(Class<E> model, String conditionValue, String orderPropertyName, String value, int start,
			int end);

	public <E> void updatePropertyByIDs(String propertyName, Object value, String ids, Class<E> model);
	
	public <E>Object findCountByCustom(Class<E> model, List<String> keys,
			List<Object> values);
	
	public <E> Object findCountByCustom(Class<E> model, List<String> keys, List<Object> values,List<String>condition);
	
	
	public <E>List<E> findListByCustom(Class<E> model, List<String> keys,
			List<Object> values,Integer startIndex, Integer pageSize,
			String orderby);
	
	public <E>List<E> findListByCustom(Class<E> model, List<String> keys,
			List<Object> values,List<String> condition,Integer startIndex, Integer pageSize,
			String orderby);

	List<T> findByPropertyWithValid(String propertyName, Object value);
	
	List<T> findByPropertyWithvalid(String propertyName, Object value);
	
	List<T> findByIds(String ids);

	/**
	 * @param list
	 */
	void saveList(List<T> list);
	
}
