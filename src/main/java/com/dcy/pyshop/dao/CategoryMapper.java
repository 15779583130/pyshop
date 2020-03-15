package com.dcy.pyshop.dao;

import com.dcy.pyshop.entity.Category;
import com.dcy.pyshop.entity.CategoryExample;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    long countByExample(CategoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int deleteByExample(CategoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int insert(Category record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int insertSelective(Category record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    List<Category> selectByExample(CategoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    Category selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int updateByExampleSelective(@Param("record") Category record, @Param("example") CategoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int updateByExample(@Param("record") Category record, @Param("example") CategoryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int updateByPrimaryKeySelective(Category record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_category
     *
     * @mbg.generated Sat Sep 15 22:10:57 CST 2019
     */
    int updateByPrimaryKey(Category record);

    List<Category> showCategory(@Param("params") Map<String, String[]> map);

    List<Category> getParent(long level);

    Category getCategoryById(long cid);

    int getNumInCategory(long cid);

    List<Category> selectByParentId(Long cparentId);

    List<Category> getSiblingsChild(Long cid);

    List<Category> getParentList(Long cid);

    List<Category> getParSiblingsChild(Long cid);

    List<HashMap<String,Object>> getReport1();

    Category selectByCid(String cid);

    String getBefore(Long cid);

    List<HashMap<String, Object>> getReport2();

    List<HashMap<String, Object>> getReport3();
}